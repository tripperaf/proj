# Aircall.io - DevOps technical test

This test is a part of our hiring process at Aircall for [DevOps positions](https://aircall.io/jobs#SystemAdministrator). It should take you between 1 and 6 hours depending on your experience.

__Feel free to apply! Drop us a line with your Linkedin/Github/Twitter/AnySocialProfileWhereYouAreActive at jobs@aircall.io__


## Summary

The purpose of the test is to reproduce one of our typical use case on the DevOps part of Aircall: __deployment__!

The story is the following:

Our backend team just developed a new service in order to resize contacts pictures to avoid downloading heavy images every time we open a contact card.

### What we want ?

With the following request to the application, the image is resized, stored and accessible from s3.

```
curl --location --request POST 'http://resize.aircall.com/image' \
--form 'file=@img.jpg' \
--form 's3Bucket=test-aricall'
```

The provided code is working. It has to be served by lambda and accessible from an http endpoint ex : (https://resize.aircall.com/image)

## Good to know

- packages have to be builded from a linux platform (docker is your friend)
- input is not a JSON but a form data (multipart/form-data)

## Nice to have

- logs
- tracing
- deployment framework
- CI/CD