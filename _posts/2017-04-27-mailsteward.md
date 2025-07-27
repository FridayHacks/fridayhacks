---
layout: post
title: "[FH #5] Big Data Email with Mailsteward"
description: "Big Data Email"
tags: [sample post, images, test]
---

Today's hack is Mac specific. We look into solving a big data problem: email search. More specifically,
we will use Mac's Mailsteward application to download and archive emails from
different accounts.

Archiving emails is a good strategy, you never know when you would need an
specific email. Mailsteward allows to archive emails into a MySQL database, so
you can perform complex queries from multiple accounts at the same time.

To get started, you need to make sure to have MySQL server installed
in your Mac. Then, go to [Mailsteward](http://www.mailsteward.com/download.html) and download a trial version
 (upgrade when you need to) to test it out. In our case, we went with a trial version of Mailsteward Pro.
 The way it works is that Mailsteward will work with Apple Mail and archive your emails
 into a database independently of Apple Mail, without removing them from Apple Mail.
 The database will be hosted locally, but you can set a remote database server if you wish so.

After installing Mailsteward, you can take a look at the MySQL tables

![MS_1]({{ site.url }}/assets/img/ms_1.png)

Next, we will connect Mailsteward with Apple Mail, so Mailsteward will be pulling
emails from Apple Mail connected accounts

![MS_2]({{ site.url }}/assets/img/ms_2.png)

Start archiving process:

![MS_3]({{ site.url }}/assets/img/ms_3.png)

![MS_4]({{ site.url }}/assets/img/ms_4.png)

Once we are done, it will tell you how many emails got archived from all your accounts.
You can allow for duplicate emails or disable duplicates.

![MS_5]({{ site.url }}/assets/img/ms_5.png)

Now you have an email database, everything indexed and organized:

![MS_6]({{ site.url }}/assets/img/ms_6.png)

You can then  perform complex search queries in your entire email database:

![MS_7]({{ site.url }}/assets/img/ms_7.png)

Finally, you can schedule automatic email archiving as follows:

![MS_8]({{ site.url }}/assets/img/ms_8.png)

And voila! Your own email database ready for big data queries.  
