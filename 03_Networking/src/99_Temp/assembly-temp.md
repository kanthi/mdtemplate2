# How to Read Assembly Language

Posted at — Feb 26, 2021

Why, in 2021, does anyone need to learn about assembly language? First, reading assembly language is the way to know *exactly* what your program is doing. Why, *exactly*, is that C++ program 1 MiB (say) instead of 100 KiB? Is it possible to squeeze some more performance out of that function that gets called all the time?

For C++ in particular, it is easy to forget or just not notice some operation (e.g., an implicit conversion or a call to a copy constructor or destructor) that is implied by the source code and language semantics, but not spelled out explicitly. Looking at the assembly generated by the compiler puts everything in plain sight.

Second, the more practical reason: so far, posts on this blog haven’t required an understanding of assembly language, despite constant links to [Compiler Explorer](https://godbolt.org/). By [popular demand](https://twitter.com/ScottWolchok/status/1361022423399755776), however, our next topic will be parameter passing, and for that, we will need a basic understanding of assembly language. We will focus only on *reading* assembly language, not writing it.

# Instructions

The basic unit of assembly language is the **instruction**. Each machine instruction is a small operation, like adding two numbers, loading some data from memory, jumping to another memory location (like the dreaded [goto](https://en.wikipedia.org/wiki/Goto) statement), or calling or returning from a function. (The x86 architecture has [lots of not-so-small instructions](https://en.wikipedia.org/wiki/Complex_instruction_set_computer) as well. Some of these are [legacy cruft](https://stackoverflow.com/questions/5959890/enter-vs-push-ebp-mov-ebp-esp-sub-esp-imm-and-leave-vs-mov-esp-ebp) built up over the 40-odd years of the architecture’s existence, and others are [newfangled additions](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions). )

# Example 1: Vector norm

Our first toy example will get us acquainted with simple instructions. It just calculates the square of the [norm](https://en.wikipedia.org/wiki/Norm_(mathematics)#Euclidean_norm) of a 2D vector:

```c++
#include <cstdint>

struct Vec2 {
    int64_t x;
    int64_t y;
    int64_t z;
};

int64_t normSquared(Vec2 v) {
    return v.x * v.x + v.y * v.y;
}
```

and here is the resulting x86_64 assembly from clang 11, [via Compiler Explorer](https://godbolt.org/#z:OYLghAFBqd5QCxAYwPYBMCmBRdBLAF1QCcAaPECAM1QDsCBlZAQwBtMQBGAFlICsupVs1qhkAUgBMAISnTSAZ0ztkBPHUqZa6AMKpWAVwC2tEAGYADKS3oAMnlqYAcsYBGmYiADspAA6oFQnVaPUMTcyt/QLU6e0cXI3dPHyUVGNoGAmZiAlDjU0tFZUxVYMzsgjjnNw9vRSycvPDChQbKh2rE2q8ASkVUA2JkDgByKTMHZEMsAGpxMx1kVvx6eexxCwBBDc3W4gNVGYA1Esk5r1ktmeuZhwIANm4AfQIZgA95y82b2/pHl5mAE9PuIvAAREFbHZ3f6vWgkIwMACOBmymHQEBOyDOADceucvj9iJgCINaDMcQA6N4zABUFOpcxkDMBdJZkO24JGfVYIBGAFYRqRTCMLELUHydHI5DMFAMhpgmWZOEKCHyxT0%2BgBrcxmSlmA2Go1G%2B5CPncIUisWkCUjIUKEBWNWi7mkOCwJBoIy%2BPDsMgUCBen1%2BlDCUScTgWTikKi%2BggeB0QVzqoWuBzZQF8lWkL1GLQEADytFYmZdpCwRhEwHYKfLeGJpRxmAdZcwbxKBnjWaFd2U3aEeFcxAzeiw/YIxDwRm7fRo9CYbA4PH4gjDYmlMgHrgdkD6qF86RbAFoC2YZkflvMwRIZHJJNbUiV0pptE1TNGbFUEklBFEgnQ31/AJ/1oL8ak8aNH1KOhykafR8kEKD0lg9p4nAxC2kAyC2jAroIL6OVBmGLgeT5QVhVrW03gADnuI9HhmKYqxmCNKQsSlOBmCBcEIEglWjGY9G9X0PH4/EpVvGRVRTTVSB1A19WNJSDVNXkRgtCiy1te1HVIZ0NTdGBEBQVBhL9chKCDETPCY8NI2jWNWHjYhE2TMs01oDN%2B1zfMixLWsKyrGsy3wBs1CbFtrTbDsuxGbNezU61WEHYdiEBUdRmtCcpxnGM6EYFga2XARJCEKsUA3eRku3eA9wPYJj1Pc9LzMa9Kvve1img0wIBsLDrG0XCf2jP90n60bgiG2pIK65DMPg8IZrSMocI6b9pvqCp%2BtaCopvw/oiKXUiBUtSi%2BRouiGNs4AWM4NiOK4niiGIfjSEE0zg1E8ZJHEyrpJdWT5L1ZTlLNdTTq0vkdKdGTjskCHrW0vTYdIJsXOCEBuCAA%3D%3D):[1](https://wolchok.org/posts/how-to-read-assembly-language/#fn:1)

```asm
        imulq   %rdi, %rdi
        imulq   %rsi, %rsi
        leaq    (%rsi,%rdi), %rax
        retq
```

Let’s talk about that first instruction: `imulq %rdi, %rdi`. This instruction [performs signed integer multiplication](https://www.felixcloutier.com/x86/imul). The `q` suffix tells us that it is operating on 64-bit quantities. (In contrast, `l`, `w`, and `b` would denote 32-bit, 16-bit, and 8-bit, respectively.) It multiplies the value in the first given register (`rdi`; register names are prefixed with a `%` sign) by the value in the second register and stores the result in that second register. This is squaring `v.x` in our example C++ code.

The second instruction does the same with the value in `%rsi`, which squares `v.y`.

Next, we have an odd instruction: `leaq (%rsi,%rdi), %rax`. `lea` stands for “load effective address”, and it stores the address of the first operand into the second operand. `(%rsi, %rdi)` means “the memory location pointed to by `%rsi + %rdi`”, so this is just adding `%rsi` and `%rdi` and storing the result in `%rax`. `lea` is a quirky x86-specific instruction; on a more [RISC](https://en.wikipedia.org/wiki/Reduced_instruction_set_computer)-y architecture like ARM64, we would expect to see a plain old `add` instruction.[2](https://wolchok.org/posts/how-to-read-assembly-language/#fn:2)

Finally, `retq` returns from the `normSquared` function.

# Registers

Let’s take a brief detour to explain what the registers we saw in our example are. Registers are the “variables” of assembly langauge. Unlike your favorite programming language (probably), there are a finite number of them, they have standardized names, and the ones we’ll be talking about are at most 64 bits in size. Some of them have specific uses that we’ll see later. I wouldn’t be able to rattle this off from memory, but [per Wikipedia](https://en.wikipedia.org/wiki/X86-64#Architectural_features), the full list[3](https://wolchok.org/posts/how-to-read-assembly-language/#fn:3) of 16 registers on x86_64 is `rax`, `rcx`, `rdx`, `rbx`, `rsp`, `rbp`, `rsi`, `rdi`, `r8`, `r9`, `r10`, `r11`, `r12`, `r13`, `r14`, and `r15`.

# Example 2: The stack

Now, let’s extend our example to debug print the `Vec2` in `normSquared`:

```c++
#include <cstdint>

struct Vec2 {
    int64_t x;
    int64_t y;
    void debugPrint() const;
};

int64_t normSquared(Vec2 v) {
    v.debugPrint();
    return v.x * v.x + v.y * v.y;
}
```

and, again, let’s see [the generated assembly](https://godbolt.org/#z:OYLghAFBqd5QCxAYwPYBMCmBRdBLAF1QCcAaPECAM1QDsCBlZAQwBtMQBGAFlICsupVs1qhkAUgBMAISnTSAZ0ztkBPHUqZa6AMKpWAVwC2tEJICcpLegAyeWpgByxgEaZiIAGykADqgWE6rR6hiaCfgFqdHYOzkZuHt5KKlG0DATMxAQhxqYWisqYqkHpmQQxTq7uXooZWTlhnLVlFXEJXgCUiqgGxMgcAORSAMz2yIZYANTiwzrICgT49DPY4gAMAILrGwvEBqqTAGpFktMA7LKbk9eT9gSe3AD6BJMAHjOXGze39A/PkwBPD7bb4AN1QeHQkywLgMwAACsQ7hAOpM0LQFsDNuIzgARLFbTZ3P4vWgkIwMACOBkymHQEGOyFOoNROM%2BYIAdDC4YjkR0Cd9iJgCL1aJNQRzXpMAFTiyXTGRygEypUEnG4gZdVggAYAVgGpFMAzWBtQOp0cjkkwUPT6mAVw04BoIOpNHS6AGsQMNhhyff6A4HvNqBtwDUaTaQzQMDQoQGtSC7jZrSHBYEg0EYfHh2GQKBBM9ncyhhKJOJw1k0qDmCO44xAXK6DS57JkATqnaRM0YtAQAPK0Vjt5OkLBGETAdhN0d4IXFUGYOMjzCvIoGWsdg13ZSboR4FzENt6LC7ghIoybro0ehMNgcHj8QSlsSWmR7lxxyBdVA%2BVJLgC0fbDJM/4LOgMy4hIMhyJIkbJEUqSaNoDSmE01itFUHhNBEgR0Ch4T%2BLhtAYfE1RNPBxR0KU9T6LkggUak1HlPYlSkVhzQ0aEqEccxsSYVwXQ2r0/QCUIOr6oa07Rq8AAcnj/g8aLPpM5YcmsHKcJMEC4IQJAOk0kx6FmObuPpqIWtBMjOk27qkF6Pp%2BoGTk%2BsGOphpJI7RrG8aJjZqYwIgKCoMZubkJQhYmR44wTuWlakNWrC1sQ9aNiOLa0G2u7dr2A5DtOY4TlOI74HOagLkukYrmuG4DJ224hpGrD7oexAAsegyRmeeAXrVKbXowLBTg%2BAiSEIE4oK%2B8hNR%2B8Dfr%2BQQAUBIFgRBUGyDIsGxoUlGmBA1j4Zwo3oSxbRkcMviEakB2jThqQke0nDnQxJR1NktGNKNz1Ua991nTx108b9WHDIJtoiZwWrieGUk6rJ8mKdFogqZwakaVpOlEMQ%2BmkIZwVFqZIySOZk3Wcmtn2b6znOWJobQ55OreQmSZupDAySHTkZeb5ZNdAuyVBCA3BAA):

```asm
        subq    $24, %rsp
        movq    %rdi, 8(%rsp)
        movq    %rsi, 16(%rsp)
        leaq    8(%rsp), %rdi
        callq   Vec2::debugPrint() const
        movq    8(%rsp), %rcx
        movq    16(%rsp), %rax
        imulq   %rcx, %rcx
        imulq   %rax, %rax
        addq    %rcx, %rax
        addq    $24, %rsp
        retq
```

In addition to the obvious call to `Vec2::debugPrint() const`, we have some other new instructions and registers! `%rsp` is special: it is the “stack pointer”, used to maintain the [function call stack](https://en.wikipedia.org/wiki/Call_stack). It points to the bottom of the stack, which grows “down” (toward lower addresses) on x86. So, our `subq $24, %rsp` instruction is making space for three 64-bit integers on the stack. (In general, setting up the stack and registers at the start of your function is called the [function prologue](https://en.wikipedia.org/wiki/Function_prologue).) Then, the following two `mov` instructions store the first and second arguments to `normSquared`, which are `v.x` and `v.y` (more about how parameter passing words in the next blog post!) to the stack, effectively creating a copy of `v` in memory at the address `%rsp + 8`. Next, we load the address of our copy of `v` into `%rdi` with `leaq 8(%rsp), %rdi` and then call `Vec2::debugPrint() const`.

After `debugPrint` has returned, we load `v.x` and `v.y` back into `%rcx` and `%rax`. We have the same `imulq` and `addq` instructions as before. Finally, we `addq $24, %rsp` to clean up the 24 bytes[4](https://wolchok.org/posts/how-to-read-assembly-language/#fn:4) of stack space we allocated at the start of our function (called the [function epilogue](https://en.wikipedia.org/wiki/Function_prologue#Epilogue)), and then return to our caller with `retq`.

# Example 3: Frame pointer and control flow

Now, let’s look at a different example. Suppose that we want to print an uppercased C string and we’d like to avoid heap allocations for smallish strings.[5](https://wolchok.org/posts/how-to-read-assembly-language/#fn:5) We might write something like the following:

```c++
#include <cstdio>
#include <cstring>
#include <memory>

void copyUppercase(char *dest, const char *src);

constexpr size_t MAX_STACK_ARRAY_SIZE = 1024;

void printUpperCase(const char *s) {
    auto sSize = strlen(s);
    if (sSize <= MAX_STACK_ARRAY_SIZE) {
        char temp[sSize + 1];
        copyUppercase(temp, s);
        puts(temp);
    } else {
        // std::make_unique_for_overwrite is missing on Godbolt.
        std::unique_ptr<char[]> temp(new char[sSize + 1]);
        copyUppercase(temp.get(), s);
        puts(temp.get());
    }
}
```

Here is [the generated assembly](https://godbolt.org/#z:OYLghAFBqd5QCxAYwPYBMCmBRdBLAF1QCcAaPECAM1QDsCBlZAQwBtMQBGAFlICsupVs1qhkAUgBMAISnTSAZ0ztkBPHUqZa6AMKpWAVwC2tEAHZeW9ABk8tTADljAI0zEuANlIAHVAsLqtHqGJua8vv5qdLb2Tkau7pxeSipRtAwEzMQEwcamForKmKqBGVkEMY4ubp6Kmdm5oQUK9RV2VfE1SQCUiqgGxMgcAORSAMx2yIZYANTiYzrILfio89jiAAwAguOT05hzC0sExHbAa5s7khO0Uwaz8zpGmEYkAJ4X25cAbqh46DM0N43gBVbzeNwsJQQZAILIzABUWBapEBdBagLhxERCkG3Xmsi%2B2zQtBamAAHt5sf4AF6YAD6BBmAFktgANekMAAqWx0AGl6VsAEpCrYATU5AEkAFrYQ4AERmnA2km4BMuPz%2BAKpdgIYIhxB0zGhJIxsPhCIU3TmZkJWxmDpmzAMRBmCgYeDpCrdJ3YtAgVvV20dMzwVBmAY9Xse80VrI53N5AuFoolDBl2Gt4ltlxDIfN2IIL284gArNJ3Z6DnIlWX5UH7XmHUDQeDIcbMBAi0ZvKjA2M7U2Hd4XQou8X8QPc47s4rlEobYOhwB6Zc%2B9AgEBGZgAawZBloeAAjgYGTRiPTUN83AB3U5F0MKGZGPAKfyiGZ0GZ6Ht4djY7BKVYEg3AAOmnJtlk3A9j1PelvBOR4CzLWRS3rMY5W7bwIHsG9MSyFDK2jGRazQyclybFt9XbaEsNA4BMAICBejdciILzEcCDHOiGKY7o2ODGczHrL5hOGXpWBAYZS2GUhTGGDZZNQKSdDkGsFH6QZq2uThZIIKTFP40gdxAbgxlAsZlTGABOMxS1LMZSySAAOSQhCk7hZPkxTSGU4ZZIUEANlIfSFPE0g4FgJA0F/f9yEoGLvD/GophEYBOGVThSCoP8i2IQKIGcAzZOcOwsjeKTdNIGLnnoAB5WhWAqsLSCwbdRHYYrWrwYhijUa9ApailihdEYqt1ZRKtk1g8GcYhyr0LAppC04jCm3oaHoJg2A4Hh%2BEEYRRBQNSZCEWbAsgXpUAQwJBoAWjqsYZju5ZYwkGQ5EkDZnqoWhUDu69VBIKsfr%2Bu6D2IfRWDu4DrqfO7fv%2Bikhhu9EAqKEoNAgKxGlMLKrEqOIEkECIAjoXGSb8MnaEJ6pEkKVJSlaCmspSPqmfKWnOnplpyhZupOfaImul6DSBiGLgJKkmS5K6vzyWcjw7o8bhAUO4AlU4UCNlAzgI1wQgSDmHTUR/JL/2NyzrVUj6ZD04qjJMsZzMkUszNLMxrI2MxnIc653OGTzZZavyAqCkKHYimBEBQVBYrceKYTj82UvVjKNiynLWDygqipa0raHK5aaq0AgGqarq2rSzqWvwXqSgGrrhuQUblomySWpmuaFowEYfJOPA1uGXSNroRgWE6vaBDc9Xjtt%2BQu4u5jfNR0kpIep6XoIdA3pO6QvtB/7AaIU4vQRsGIahmHUDhw%2B7uRzBV4UdHGaxnH9DyQQCaFunKciQJ%2BakzSFzYmrMMZpDKA0D%2BoQwGv3SK0EBXQBZQJCHjZBbRYi/04KLTSEtsEBxlt5JSUkFZKxVmrNKmtta631vgE%2BlssrfmTslbE4xJDWz3vbMKjsQDXFAu7VU3AHKK0kNZaypYZ4eS8nLKSYdgqhUMlLYYkhpEh1kRHbhvRrz5UCKZIAA%3D):[6](https://wolchok.org/posts/how-to-read-assembly-language/#fn:6)

```asm
printUpperCase(char const*):                  # @printUpperCase(char const*)
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %r15
        pushq   %r14
        pushq   %rbx
        pushq   %rax
        movq    %rdi, %r14
        callq   strlen
        leaq    1(%rax), %rdi
        cmpq    $1024, %rax                     # imm = 0x400
        ja      .LBB0_2
        movq    %rsp, %r15
        movq    %rsp, %rbx
        addq    $15, %rdi
        andq    $-16, %rdi
        subq    %rdi, %rbx
        movq    %rbx, %rsp
        movq    %rbx, %rdi
        movq    %r14, %rsi
        callq   copyUppercase(char*, char const*)
        movq    %rbx, %rdi
        callq   puts
        movq    %r15, %rsp
        leaq    -24(%rbp), %rsp
        popq    %rbx
        popq    %r14
        popq    %r15
        popq    %rbp
        retq
.LBB0_2:
        callq   operator new[](unsigned long)
        movq    %rax, %rbx
        movq    %rax, %rdi
        movq    %r14, %rsi
        callq   copyUppercase(char*, char const*)
        movq    %rbx, %rdi
        callq   puts
        movq    %rbx, %rdi
        leaq    -24(%rbp), %rsp
        popq    %rbx
        popq    %r14
        popq    %r15
        popq    %rbp
        jmp     operator delete[](void*)                          # TAILCALL
```

Our function prologue has gotten a lot longer, and we have some new control flow instructions as well. Let’s take a closer look at the prologue:

```asm
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %r15
        pushq   %r14
        pushq   %rbx
        pushq   %rax
        movq    %rdi, %r14
```

The `pushq %rbp; movq %rsp, %rbp` sequence is very common: it pushes the [frame pointer](https://en.wikipedia.org/wiki/Call_stack#FRAME-POINTER) stored in `%rbp` to the stack and saves the old stack pointer (which is the new frame pointer) in `%rbp`. The following four `pushq` instructions store registers that [we need to save before using](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI).[7](https://wolchok.org/posts/how-to-read-assembly-language/#fn:7) Finally, we save our first argument (`%rdi`) in `%r14`.

On to the function body. We call `strlen(s)` with `callq strlen` and store `sSize + 1` in `%rdi` with `lea 1(%rax), %rdi`.

Next, we finally see our first `if` statement! `cmpq $1024, %rax` sets the [flags register](https://en.wikipedia.org/wiki/FLAGS_register) according to the result of `%rax - $1024`, and then `ja .LBB0_2` (“jump if above”) transfers control to the location labeled `.LBB0_2` if the flags indicate that `%rax > 1024`. In general, higher-level control-flow primitives like `if`/`else` statements and loops are implemented in assembly using conditional jump instructions.

Let’s first look at the path where `%rax <= 1024` and thus the branch to `.LBB0_2` was not taken. We have a blob of instructions to create `char temp[sSize + 1]` on the stack:

```asm
        movq    %rsp, %r15
        movq    %rsp, %rbx
        addq    $15, %rdi
        andq    $-16, %rdi
        subq    %rdi, %rbx
        movq    %rbx, %rsp
```

We save `%rsp` to `%r15` and `%rbx` for later use.[8](https://wolchok.org/posts/how-to-read-assembly-language/#fn:8) Then, we add 15 to `%rdi` (which, remember, contains the size of our array), mask off the lower 4 bits with `andq $-16, %rdi`, and subtract the result from `%rbx`, which we then put back into `%rsp`. In short, this rounds the array size up to the next multiple of 16 bytes and makes space for it on the stack.

The following block simply calls `copyUppercase` and `puts` as written in the code:

```asm
        movq    %rbx, %rdi
        movq    %r14, %rsi
        callq   copyUppercase(char*, char const*)
        movq    %rbx, %rdi
        callq   puts
```

Finally, we have our function epilogue:

```asm
        movq    %r15, %rsp
        leaq    -24(%rbp), %rsp
        popq    %rbx
        popq    %r14
        popq    %r15
        popq    %rbp
        retq
```

We restore the stack pointer to deallocate our variable-length array using `leaq`. Then, we `popq` the registers we saved during the function prologue and return control to our caller, and we are done.

Next, let’s look at the path when `%rax > 1024` and we branch to `.LBB0_2`. This path is more straightforward. We call `operator new[]`, save the result (returned in `%rax`) to `%rbx`, and call `copyUppercase` and `puts` as before. We have a separate function epilogue for this case, and it looks a bit different:

```asm
        movq    %rbx, %rdi
        leaq    -24(%rbp), %rsp
        popq    %rbx
        popq    %r14
        popq    %r15
        popq    %rbp
        jmp     operator delete[](void*)                          # TAILCALL
```

The first `mov` sets up `%rdi` with a pointer to our heap-allocated array that we saved earlier. As with the other function epilogue, we then restore the stack pointer and pop our saved registers. Finally, we have a new instruction: `jmp operator delete[](void *)`. `jmp` is just like `goto`: it transfers control to the given label or function. Unlike `callq`, it does not push the return address onto the stack. So, when `operator delete[]` returns, it will instead transfer control to `printUpperCase`’s caller. In essence, we’ve combined a `callq` to `operator delete` with our own `retq`. This is called [tail call optimization](https://en.wikipedia.org/wiki/Tail_call), hence the `# TAILCALL` comment helpfully emitted by the compiler.

# Practical application: catching surprising conversions

I said in the introduction that reading assembly makes implicit copy and destroy operations abundantly clear. We saw some of that in our previous example, but I want to close by looking at a common C++ move semantics debate. Is it OK to take parameters by value in order to avoid having one overload for lvalue references and another overload for rvalue references? There is a school of thought that says “yes, because in the lvalue case you will make a copy anyway, and in the rvalue case it’s fine as long as your type is cheap to move”. If we take a look at an example for the rvalue case, we will see that “cheap to move” does not mean “free to move”, as much as we might prefer otherwise. If we want maximum performance, we can demonstrate that the overload solution will get us there and the by-value solution will not. (Of course, if we aren’t willing to write extra code to improve performance, then “cheap to move” is probably cheap enough.)

```c++
#include <string>

class MyString {
 std::string str;
 public:
  explicit MyString(const std::string& s);
  explicit MyString(std::string&& s);
};

class MyOtherString {
  std::string str;
 public:
  explicit MyOtherString(std::string s);
};

void createRvalue1(std::string&& s) {
    MyString s2(std::move(s));
};

void createRvalue2(std::string&& s) {
    MyOtherString s2(std::move(s));
};
```

If we look at [the generated assembly](https://godbolt.org/#z:OYLghAFBqd5QCxAYwPYBMCmBRdBLAF1QCcAaPECAM1QDsCBlZAQwBtMQBGAFlICsupVs1qhkAUgBMAISnTSAZ0ztkBPHUqZa6AMKpWAVwC2tEJIDspLegAyeWpgByxgEaZiIAGykADqgWE6rR6hiZmln4BanR2Ds5Gbh7eSirRtAwEzMQEIcamForKmKpBGVkEsU6u7l6Kmdm5YQUK9RX2VQk1ngCUiqgGxMgcAORSAMz2yIZYANTiYzotxPbA89jiAAwAgptbU8wKCjMAsgCeGcuic%2Bay2zMt6CAgSyv3BMTzt1szPgYurHhkCBdjMZpgAB4%2BAHIQgnc7vFYQNC0FpvR7PBGiKSee7dT4gsGQ6Gws4XREPJ4vLGSTzY3H47bicwAEQZO22%2B0OcIA8gQEO4yVcmV9QRSMZdgG8PmMRb9/oDgXdCVDASTTrz%2BcRBcAIGKqZKFHiZbsmazjYztgA3VB4dAzZDETDMAiYABKlrYBkwnF1BHR%2BuxdMN1xFoLh2vukl96KMqEtmF13SNX1NbN21tt9sdzrdHsMmCjesxqxpQe6IYJoLOGoFxcj0aesfjieTJpZn2GvVYIGGAFZhqRTMMNgPUD2dHI5Pd%2BoNMHNJGNOAOCD2R0nSABrMwATgAdJwNr2xp4D54ABxnxdjbeSIQ97gDocj0hj4YDhQgDakFfDzukOCwEgaBGD4eDsGQFBIqgIFgTU%2ByiJwB6cKQVBgS6xAfhALirgOLj2Fkpw9kupDAUYWgENytCsIRv6kFgRgiMA7A4XReCOiU8YfrRELFAYLpEQO9gut2wzEQCLjEARehYAJ37LEYAm9DQ9BMGwHA8PwgjCKIKCTjIQh4C4H6QL0qA%2BGkXEALTcmMMyWQ88zMhIMhyJIGx2VQtCoJZEJDOZQQKO%2BRQlBoEDWI0pjIdYlTxIkgiRIEdARfF/iJbQMXVB4yEpMUaRlA0%2Bh5IIOUhekrQZZ0WV1OUyXZeV7SxTUnC9AoM5DFwXY9v2g4sa%2B4Jnp4lmeNw9raZKiG7hs%2B4zBAuCECQ86LqQMx6DB4GLc1K16dIy44euW5jOYu69ieYyHr227mJevaSANd7DA%2BPW0a%2B76ft%2Be3/jAiAoNBoHgeQlDAX9cFjYhGzIahrDoZh2G0XhtAEbJpHkZR1EsfRjHMbR%2BDsWonEsTxyB8SMxFCcoLHiZJxCnNJIzPgiCmiX%2BymMCwzEaQIt5jbpLn6eJxkQKZ/l0FZNl2Q5YxOdtbkeV5Pngn5FlBakQSaNoyWSFF2gVXFbm%2BKlaQa8hCVpDrNR6yVeWtEbhQq3Q%2BVtHEmVmF%2BLQ1YVTR1eUZseG5LVtepnV9o%2BvU9v1g3DaNjEzBNU2cDNc1EMQG3LatwPJ%2BMkjlhOvM7e9v77SAYxjLuxdl%2BXFf3Y9T6jj2r1fj%2Ba5B5IIfPXX%2BdN6Q8YYar3BAA%3D)[9](https://wolchok.org/posts/how-to-read-assembly-language/#fn:9) (which is too long to include even though I’ve intentionally outlined[10](https://wolchok.org/posts/how-to-read-assembly-language/#fn:10) the constructors in question), we can see that `createRvalue1` does 1 move operation (inside the body of `MyString::MyString(std::string&&)`) and 1 `std::string::~string()` call (the `operator delete` before returning). In contrast, `createRvalue2` is much longer: it does a total of 2 move operations (1 inline, into the `s` parameter for `MyOtherString::MyOtherString(std::string s)`, and 1 in the body of that same constructor) and 2 `std::string::~string` calls (1 for the aforementioned `s` parameter and 1 for the `MyOtherString::str` member). To be fair, moving `std::string` is cheap and so is destroying a moved-from `std::string`, but it is not free in terms of either CPU time or code size.

# Further reading

Assembly language [dates back to the late 1940s](https://hackaday.com/2018/08/21/kathleen-booth-assembling-early-computers-while-inventing-assembly/), so there are plenty of resources for learning about it. Personally, my first introduction to assembly language was in the [EECS 370: Introduction to Computer Organization](https://eecs370.github.io/) junior-level course at my alma mater, the University of Michigan. Unfortunately, most of the course materials linked on that website are not public. Here are what appear to be the corresponding “how computers really work” courses at [Berkeley (CS 61C)](https://www2.eecs.berkeley.edu/Courses/CS61C/), [Carnegie Mellon (15-213)](https://web.stanford.edu/class/cs107/index.html), [Stanford (CS107)](https://web.stanford.edu/class/cs107/index.html), and [MIT (6.004)](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-004-computation-structures-spring-2017/). (Please let me know if I’ve suggested the wrong course for any of thse schools!) [Nand to Tetris](https://www.nand2tetris.org/) also appears to cover similar material, and the projects and book chapters are [freely available](https://www.nand2tetris.org/course).

My first practical exposure to x86 assembly in particular was in the context of security exploits, or learning to become a “l33t h4x0r”, as the kids used to say. If this strikes you as a more entertaining reason to learn about assembly, great! The classic work in the space is [Smashing the Stack for Fun and Profit](https://insecure.org/stf/smashstack.html). Unfortunately, modern security mitigations complicate running the examples in that article on your own, so I recommend finding a more modern practice environment. [Microcorruption](https://microcorruption.com/login) is an industry-created example, or you could try finding an application security project from a college security course to follow along with (e.g., Project 1 from Berkeley’s [CS 161](https://cs161.org/), which seems to be publicly available currently).

Finally, there is always Google and Hacker News. [Pat Shaughnessy’s “Learning to Read x86 Assembly Language](http://patshaughnessy.net/2016/11/26/learning-to-read-x86-assembly-language) from 2016 covers the topic from the perspective of Ruby and Crystal, and there was also [a recent (2020) discussion on how to learn x86_64 assembly](https://news.ycombinator.com/item?id=22279051).

Good luck, and happy hacking!

------

1. I use AT&T syntax because it’s the default syntax in Linux tools. If you prefer Intel syntax, the toggle is on Compiler Explorer under “Output”. Compiler Explorer links in this article will show both, with AT&T on the left and Intel on the right. Guides to the differences [are short and readily available](http://staffwww.fullcoll.edu/aclifton/courses/cs241/syntax.html); briefly, Intel syntax is more explicit about memory references, drops the `b`/`w`/`l`/`q` suffixes, and puts the destination operand first instead of last. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:1)
2. If you actually look at [the ARM64 assembly](https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(fontScale:14,j:1,lang:c%2B%2B,selection:(endColumn:2,endLineNumber:10,positionColumn:2,positionLineNumber:10,selectionStartColumn:2,selectionStartLineNumber:10,startColumn:2,startLineNumber:10),source:'%23include+ struct+Vec2+{ ++++int64_t+x%3B ++++int64_t+y%3B }%3B int64_t+normSquared(Vec2+v)+{ ++++return+v.x+*+v.x+%2B+v.y+*+v.y%3B }'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:armv8-clang1101,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'1',libraryCode:'1',trim:'1'),fontScale:14,j:1,lang:c%2B%2B,libs:!((name:boost,ver:'175')),options:'-O3+-std%3Dc%2B%2B20',selection:(endColumn:1,endLineNumber:1,positionColumn:1,positionLineNumber:1,selectionStartColumn:1,selectionStartLineNumber:1,startColumn:1,startLineNumber:1),source:1),l:'5',n:'0',o:'armv8-a+clang+11.0.1+(Editor+%231,+Compiler+%231)+C%2B%2B',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4) for this example, you’ll see an `madd` instruction get used instead: `madd x0, x0, x0, x8`. This is a multiply+add in one instruction: it’s doing `x0 = x0 * x0 + x8`. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:2)
3. These are just the 64-bit registers used by most integer instructions. There are actually [a lot more registers](https://en.wikipedia.org/wiki/X86#/media/File:Table_of_x86_Registers_svg.svg) that came with floating point and instruction set extensions. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:3)
4. You may have noticed that we only used 16 bytes of stack space despite allocating 24. As far as I can tell, the extra 8 bytes are left over from the code to set up and restore the [frame pointer](https://en.wikipedia.org/wiki/Call_stack#FRAME-POINTER), which was optimized out. Clang, gcc, and icc all seem to leave the extra 8 bytes in, and msvc seems to waste 16 bytes instead of 8. If we [build with -fno-omit-frame-pointer](https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(fontScale:14,j:1,lang:c%2B%2B,selection:(endColumn:1,endLineNumber:6,positionColumn:1,positionLineNumber:6,selectionStartColumn:1,selectionStartLineNumber:5,startColumn:1,startLineNumber:5),source:'%23include+ struct+Vec2+{ ++++int64_t+x%3B ++++int64_t+y%3B ++++void+debugPrint()+const%3B }%3B int64_t+normSquared(Vec2+v)+{ ++++v.debugPrint()%3B ++++return+v.x+*+v.x+%2B+v.y+*+v.y%3B }'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:clang1101,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'1',libraryCode:'1',trim:'1'),fontScale:14,j:1,lang:c%2B%2B,libs:!(),options:'-O3+-std%3Dc%2B%2B20+-fno-omit-frame-pointer',selection:(endColumn:1,endLineNumber:1,positionColumn:1,positionLineNumber:1,selectionStartColumn:1,selectionStartLineNumber:1,startColumn:1,startLineNumber:1),source:1),l:'5',n:'0',o:'x86-64+clang+11.0.1+(Editor+%231,+Compiler+%231)+C%2B%2B',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4), we can see that the other 8 bytes are used to `pushq %rbp` at the start of the function and later `popq %rbp` at the end. Compilers aren’t perfect; you will see this sort of small missed optimization from time to time if you read assembly a lot. Sometimes things really are missed optimization opportunities, but there are also lots of unfortunate ABI constraints that force suboptimal code generation for reasons of compatibility between pieces of code built with different compilers (or even different versions of the same compiler). [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:4)
5. Also suppose that we don’t have something like [absl::FixedArray](https://github.com/abseil/abseil-cpp/blob/master/absl/container/fixed_array.h) available. I didn’t want to complicate the example any further. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:5)
6. I built with `-fno-exceptions` to simplify the example by removing the exception cleanup path. It appears right after a tail call, which I think might be confusing. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:6)
7. Another possible missed optimization: I don’t see a need to `pushq %rax` here; it’s not callee-saved and we don’t care about the value on entry to `printUpperCase`. Get in touch if you know whether this is a missed optimization or there’s actually a reason to do it! [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:7)
8. Yet again, I think that this `movq %rsp, %r15` is not needed. `%r15` is not used again until we `movq %r15, %rsp`, but that instruction is immediately followed by `leaq -24(%rbp), %rsp`, which overwrites `%rsp` immediately. I think that we could improve the code by removing the two `movq %rsp, %r15` and `movq %r15, %rsp` instructions. On the other hand, Intel’s icc compiler [also does seemingly silly things to restore `%rsp`](https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(fontScale:14,j:1,lang:c%2B%2B,selection:(endColumn:74,endLineNumber:16,positionColumn:74,positionLineNumber:16,selectionStartColumn:74,selectionStartLineNumber:16,startColumn:74,startLineNumber:16),source:'%23include+ %23include+ %23include+ void+copyUppercase(char+*dest,+const+char+*src)%3B constexpr+size_t+MAX_STACK_ARRAY_SIZE+%3D+1024%3B void+printUpperCase(const+char+*s)+{ ++++auto+sSize+%3D+strlen(s)%3B ++++if+(sSize+<%3D+MAX_STACK_ARRAY_SIZE)+{ ++++++++char+temp[sSize+%2B+1]%3B ++++++++copyUppercase(temp,+s)%3B ++++++++puts(temp)%3B ++++}+else+{ ++++++++//+std::make_unique_for_overwrite+is+missing+on+Compiler+Explorer. ++++++++std::unique_ptr+temp(new+char[sSize+%2B+1])%3B ++++++++copyUppercase(temp.get(),+s)%3B ++++++++puts(temp.get())%3B ++++} }'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:43.31039755351682,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:clang1101,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'1',libraryCode:'1',trim:'1'),fontScale:14,j:1,lang:c%2B%2B,libs:!(),options:'-O3+-std%3Dc%2B%2B20+-fno-vectorize+-fno-unroll-loops+-fno-exceptions',selection:(endColumn:27,endLineNumber:18,positionColumn:1,positionLineNumber:13,selectionStartColumn:27,selectionStartLineNumber:18,startColumn:1,startLineNumber:13),source:1),l:'5',n:'0',o:'x86-64+clang+11.0.1+(Editor+%231,+Compiler+%231)+C%2B%2B',t:'0')),k:24.794543292249717,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:icc202119,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'1',libraryCode:'0',trim:'1'),fontScale:14,j:2,lang:c%2B%2B,libs:!(),options:'-O3+-std%3Dc%2B%2B20+-fno-vectorize+-fno-unroll-loops+-fno-exceptions',selection:(endColumn:19,endLineNumber:28,positionColumn:19,positionLineNumber:28,selectionStartColumn:19,selectionStartLineNumber:28,startColumn:19,startLineNumber:28),source:1),l:'5',n:'0',o:'x86-64+icc+21.1.9+(Editor+%231,+Compiler+%232)+C%2B%2B',t:'0')),k:31.895059154233465,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4) given this code, so either there is a good reason to do them, or cleaning up stack pointer manipulations in the presence of variable-length arrays is just a hard or neglected problem in compilers. Again, feel free to reach out if you know which it is! [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:8)
9. Again, I built with `-fno-exceptions` to avoid complicating things with exception cleanup paths. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:9)
10. If we [inline the constructors for `MyString` and `MyOtherString`](https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(fontScale:14,j:1,lang:c%2B%2B,selection:(endColumn:40,endLineNumber:12,positionColumn:40,positionLineNumber:12,selectionStartColumn:40,selectionStartLineNumber:12,startColumn:40,startLineNumber:12),source:'%23include+ class+MyString+{ +std::string+str%3B +public: ++explicit+MyString(std::string%26%26+s)+:+str(std::move(s))+{} }%3B class+MyOtherString+{ ++std::string+str%3B +public: ++explicit+MyOtherString(std::string+s):+str(std::move(s))+{} }%3B void+createRvalue1(std::string%26%26+s)+{ ++++MyString+s2(std::move(s))%3B }%3B void+createRvalue2(std::string%26%26+s)+{ ++++MyOtherString+s2(std::move(s))%3B }%3B'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:40.48706240487063,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:clang1101,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'1',libraryCode:'1',trim:'1'),fontScale:14,j:1,lang:c%2B%2B,libs:!(),options:'-O3+-std%3Dc%2B%2B20+-fno-exceptions',selection:(endColumn:1,endLineNumber:1,positionColumn:1,positionLineNumber:1,selectionStartColumn:1,selectionStartLineNumber:1,startColumn:1,startLineNumber:1),source:1),l:'5',n:'0',o:'x86-64+clang+11.0.1+(Editor+%231,+Compiler+%231)+C%2B%2B',t:'0')),k:59.51293759512938,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4), we do get some savings in `createRvalue2`: we call `operator delete` at most once. However, we still do 2 move operations and we require 32 extra bytes of stack space. [↩︎](https://wolchok.org/posts/how-to-read-assembly-language/#fnref:10)

[Ezhil theme](https://github.com/vividvilla/ezhil) | Built with [Hugo](https://gohugo.io/)