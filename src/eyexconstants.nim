# *eyex* - Nim bindings for the Tobii EyeX eye tracking SDK.
#
# This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
# See the file LICENSE included in this distribution for licensing details.
# GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

const
  txMaskWeightNone = 0
    ## Use this mask weight to indicate that a region of an interactor has no
    ## weight (not interactable).

  txMaskWeightDefault = 1
    ## Use this mask weight to indicate that a region of an interactor has a
    ## default weight.

  txMaskWeightHigh = 255
    ## Use this mask weight to indicate that a region of an interactor has a high
    ## weight (more likely to be interacted with).
