# corona-cacharro

Returns information of the device

## Installation

Ensure the bower registry is `https://yogome-bower.herokuapp.com` and then `bower install cacharro`

## Available information

### Boolean

* cacharro.isSimulator
* cacharro.isApple
* cacharro.isGoogle
* cacharro.isKindleFire
* cacharro.isNook
* cacharro.is_iPad
* cacharro.isTall

### Strings

* cacharro.store 
  Possible values: 
  'iOS', 'Play', 'Kindle', 'Nook', '' (Simulator)


## Usage

```lua
local cacharro = require 'cacharro'

print(cacharro.isSimulator)
```