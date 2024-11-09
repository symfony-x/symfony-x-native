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

#### Troubleshooting

Find invalid imports that appear anywhere in your code. Run...

   ```bash
   php bin/console cache:clear
   ```
Clears Symfony's cache and also clears an internal cache in AssetMapper. Now run...

   ```bash
   php bin/console debug:asset
   ```

This re-builds the cache for all of those assets internally. When it does that, it parses your files and reports any missing imports.

## Stimulus

Lazy loading stimulus controllers

   ```js
   // imports
   /* stimulusFetch: 'lazy' */
   // code
   ```


