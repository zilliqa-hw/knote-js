# knote-js
A tweaked copy of learnk8s/knote-js

## Changes to the original

- Dockerfile reworked. Because:
  - Too old Node.js version, full of CVEs.
  - Lazy way to copy evertything, including package-lock.json and friends. This is unnecessary.
  - It shouldn't install with `npm install`
  - It shouldn't install in the container build context. You can't cache in build context.
    Noone should ever do a build in build context.
- The old package-lock.json has been recreated. Dependencies updated.
