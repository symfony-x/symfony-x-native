# Symfony-X Quick Reference (QR)

Symfony-X Quick Reference (QR) contains common CLI used during the course of Symfony development.

## AssetMapper & Asset

#### 3rd Party npm libraries import into importmap

   ```bash
   php bin/console importmap:require NPM_LIBRARY
   ```
   
   ```bash
   php bin/console importmap:update
   ```
   
   ```bash
   php bin/console importmap:require NPM_LIBRARY --download
   ```


## Stimulus

Lazy loading stimulus controllers

   ```js
   // imports
   /* stimulusFetch: 'lazy' */
   // code
   ```


