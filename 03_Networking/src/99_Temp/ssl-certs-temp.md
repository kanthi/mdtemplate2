# SSL CERTS



### **Types of SSL Certificates**

You want to get the right [type of SSL certificates](https://neilpatel.com/blog/ssl-certificate-guide/) for your site. Understanding the basic differences between them will help you avoid buying more than you need, or not getting enough.

There are three types of SSL certificates you’ll encounter. They vary according to validation level:

- **Domain Validated** (**DV**): DV certificates show that the certificate authority has validated that you are the owner of a particular domain. These are typically free, but since you don’t have to demonstrate anything beyond control over a domain, they have the lowest level of trust.
- **Organization Validated** (**OV**): OV certificates show that the certificate authority has validated that your organization is real, has a known physical location, and controls the domain. These are not free and may take several days to acquire, as they require a real-world identity check. As such, OV certificates have a higher level of trust than DVs.
- **Extended Validation** (**EV**): EV certificates have the most extensive validation process. In addition to checking everything required for an OV, an EV also requires the examination of corporate documents.

Generally speaking, different types of SSL certificates from the same provider will have the same level of encryption. It’s the authentication process that adds the extra level of trust.

The encryption that comes with DV certificates is key. But when encryption is tied to the rigorous identity check of and OV or EV certificates, it becomes much harder for bad actors to carry out phishing or [man-in-the-middle](https://www.globalsign.com/en-in/blog/what-is-a-man-in-the-middle-attack) attacks.

In some industries, like finance and healthcare, you may have to get an EV SSL certificate. This is just a bullet to bite. This is also true if you have a high-profile website that could be a juicy target for attackers.

Some choose to get OV or EV certificates for branding purposes. This was more important when browsers like Chrome showed a green padlock next to the site’s URL. 

Google started phasing that out and now everyone gets the same gray padlock, regardless of the type of validation. Even PayPal doesn’t have a green lock in Chrome any more:



There is, of course, more information about the organization in the certificate details if you get an OV or EV, but who is checking that?

If you can avoid paying for OV or EV, I recommend doing that. Just check to make sure that it’s going to work for your industry and with any payment gateway software you use.

In terms of picking between different vendors, be sure you are making an apples-to-apples comparison. 

For example, Secure Site SSL from Digicert is an OV certification, though it doesn’t say so by name, whereas a Single Domain OV certificate from Sectigo makes it more obvious.

Speaking of single domain certificates, there are two important subtypes of SSL certificates:

- **Wildcard SSL certificates** cover an unlimited number of subdomains.
- **Subject Alternative Name (SAN) SSL certificates** cover a certain number of additional domains. These may also be called “multi-domain” or UCC (unified communications certificate).

The exact limitations will vary from provider to provider. With GlobalSign, for example, you purchase the type of SSL certificate you want (DV, OV, or EV) and then pay an extra $199/year for every additional domain, and $99/year for each subdomain.

Alternatively, GlobalSign offers a Wildcard SSL that will secure an unlimited number of subdomains for $849/year.

If you need to secure multiple domains or lots of subdomains on a tight budget, I recommend SSL.com. They have Wildcards starting as low as $225 and SAN certificates that can secure up to 500 domains for $142/year.

One final note: it’s possible to use multiple certificate providers. Many company’s use [free SSL certificates](http://www.neilpatel.com/blog/best-free-ssl-certificate/) from Let’s Encrypt for everything they can, and use paid SSL certificates to cover everything else.



