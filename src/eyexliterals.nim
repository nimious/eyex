# *eyex* - Nim bindings for the Tobii EyeX eye tracking SDK.
#
# This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
# See the file LICENSE included in this distribution for licensing details.
# GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

var # Message Literals
  txLiteralHeader*: cstring = "Header"
  txLiteralBody*: cstring = "Body"
  txLiteralId*: cstring = "Id"
  txLiteralProcessId*: cstring = "ProcessId"


var # Client Literals
  txLiteralAgentId*: cstring = "AgentId"
  txLiteralTargetProcessId*: cstring = "TargetProcessId"
  txLiteralClientMode*: cstring = "ClientMode"


var # Miscellaneous Literals
  txLiteralType*: cstring = "Type"
  txLiteralTimestamp*: cstring = "Timestamp"
  txLiteralData*: cstring = "Data"
  txLiteralParameters*: cstring = "Parameters"
  txLiteralX*: cstring = "X"
  txLiteralY*: cstring = "Y"
  txLiteralZ*: cstring = "Z"


var # Bounds Literals
  txLiteralBounds*: cstring = "Bounds"
  txLiteralBoundsType*: cstring = "BoundsType"
  txLiteralNone*: cstring = "None"
  txLiteralRectangular*: cstring = "Rectangular"
  txLiteralTop*: cstring = "Top"
  txLiteralLeft*: cstring = "Left"
  txLiteralRight*: cstring = "Right"
  txLiteralBottom*: cstring = "Bottom"
  txLiteralWidth*: cstring = "Width"
  txLiteralHeight*: cstring = "Height"


var # Interactor Literals
  txLiteralRootId*: cstring = "_RootId"
  txLiteralGlobalInteractorWindowId*: cstring = "GlobalInteractorWindowId"
  txLiteralMask*: cstring = "Mask"
  txLiteralMaskId*: cstring = "MaskId"
  txLiteralMaskBounds*: cstring = "MaskBounds"


var # Mask Literals
  txLiteralMaskType*: cstring = "MaskType"
  txLiteralRowCount*: cstring = "RowCount"
  txLiteralColumnCount*: cstring = "ColumnCount"


var # Gaze Point Data Behavior Literals
  txLiteralGazePointDataMode*: cstring = "GazePointDataMode"
  txLiteralGazePointDataEventType*: cstring = "GazePointDataEventType"


var # Activation Behavior Literals
  txLiteralActivatableEventType*: cstring = "ActivatableEventType"
  txLiteralHasActivationFocus*: cstring = "HasActivationFocus"
  txLiteralHasActiveActivationFocus*: cstring = "HasTentativeActivationFocus"
  txLiteralIsActivated*: cstring = "IsActivated"
  txLiteralIsTentativeFocusEnabled*: cstring = "IsTentativeFocusEnabled"
  txLiteralIsSmallItemDetectionEnabled*: cstring = "IsSmallItemDetectionEnabled"


var # Fixation Data Behavior Literals
  txLiteralFixationDataMode*: cstring = "FixationDataMode"
  txLiteralFixationDataEventType*: cstring = "FixationDataEventType"


var # Action data Behavior Literals
  txLiteralActionDataEventType*: cstring = "ActionDataEventType"
  txLiteralActivationMissed*: cstring = "ActivationMissed"


var # Gaze-Aware Behavior Literals
  txLiteralHasGaze*: cstring = "HasGaze"
  txLiteralGazeAwareMode*: cstring = "GazeAwareMode"
  txLiteralDelayTime*: cstring = "DelayTime"


var # Gaze Data Diagnostics Behavior Literals
  txLiteralQuality*: cstring = "Quality"
  txLiteralNoise*: cstring = "Noise"
  txLiteralInSaccade*: cstring = "InSaccade"
  txLiteralInFixation*: cstring = "InFixation"


var # Eye Position Behavior Literals
  txLiteralLeftEyePosition*: cstring = "LeftEyePosition"
  txLiteralRightEyePosition*: cstring = "RightEyePosition"
  txLiteralLeftEyePositionNormalized*: cstring = "LeftEyePositionNormalized"
  txLiteralRightEyePositionNormalized*: cstring = "RightEyePositionNormalized"
  txLiteralHasLeftEyePosition*: cstring = "HasLeftEyePosition"
  txLiteralHasRightEyePosition*: cstring = "HasRightEyePosition"


var # Presence Behavior Literals
  txLiteralPresenceData*: cstring = "Presence"


var # Pannable Behavior Literals
  txLiteralPanVelocityX*: cstring = "PanVelocityX"
  txLiteralPanVelocityY*: cstring = "PanVelocityY"
  txLiteralPanStepX*: cstring = "PanStepX"
  txLiteralPanStepY*: cstring = "PanStepY"
  txLiteralPanStepDuration*: cstring = "PanStepDuration"
  txLiteralPanHandsFree*: cstring = "PanHandsFree"
  txLiteralPanProfile*: cstring = "Profile"
  txLiteralPanDirectionsAvailable*: cstring = "PanDirectionsAvailable"
  txLiteralPanPeakVelocity*: cstring = "PeakVelocity"
  txLiteralPanAdaptVelocityToViewport*: cstring = "AdaptVelocityToViewport"
  txLiteralPanMaxPanZoneRelativeSize*: cstring = "MaxPanZoneRelativeSize"
  txLiteralPanMaxPanZoneSize*: cstring = "MaxPanZoneSize"
  txLiteralPanZoneSize*: cstring = "PanZoneSize"
  txLiteralPannableEventType*: cstring = "PannableEventType"


var # Callback Response Literals
  txLiteralRequestType*: cstring = "RequestType"
  txLiteralRequestId*: cstring = "RequestId"
  txLiteralErrorMessage*: cstring = "ErrorMessage"
  txLiteralResult*: cstring = "Result"


var # Interaction Mode Literals
  txLiteralActionType*: cstring = "ActionType"


var # State literals
  txLiteralStatePath*: cstring = "StatePath"
  txLiteralStatePathDelimiter*: cstring = "."


var # Configuration Tool Literals
  txLiteralConfigurationTool*: cstring = "ConfigurationTool"


var # Literals for state paths.
  txStatePathEyeTracking*: cstring = "eyeTracking"
    ## The root node for all eyetracking information.

  txStatePathScreenBounds*: cstring = "eyeTracking.screenBounds"
    ## Holds the virtual screen bounds in pixels. The value can be retrieved from
    ## the state bag as a TX_RECT structure with GetStateValueAsRectangle. If the
    ## screen bounds can not be determined screen bounds (0, 0, 0, 0) will be
    ## returned.

  txStatePathDisplaySize*: cstring = "eyeTracking.displaySize"
    ## Holds the display size in millimetres as width and height. The value can
    ## be retrieved from the state bag as a `TxSize2 <#TxSize2>`_ structure with
    ## `GetStateValueAsSize2 <#GetStateValueAsSize2>`_. If the display size can
    ## not be determined Width and Height `(0, 0)` will be returned.

  txStatePathEyeTrackingState*: cstring = "eyeTracking.state"
    ## Holds the eye tracking status. The value is of type
    ## `TxEyeTrackingDeviceStatus <#TxEyeTrackingDeviceStatus>`_.

  txStatePathProfileName*: cstring = "eyeTracking.profileName"
    ## Holds the name of the eye tracking profile used. The value is of type
    ## `TxString <#TxString>`_.

  txStatePathConfigurationStatus*: cstring = "eyeTracking.configurationStatus"
    ## Holds the configuration status of the eye tracker. The value is of type
    ## `TxEyeTrackingConfigurationStatus <#TxEyeTrackingConfigurationStatus>`_.

  txStatePathEngineVersion*: cstring = "engineVersion"
    ## Reports the engine version. The value is of type
    ## `TxString <#TxString>`_.

  txStatePathUserPresence*: cstring = "userPresence"
    ## Holds data about user presence. The value is of type
    ## `TxUserPresence <#TxUserPresence>`_.

  txStatePathFailedAction*: cstring = "failedAction"
    ## Notifies when interactions fail. The value is of type
    ## `TxFailedActionType <#TxFailedActionType>`_.

  txStatePathInteractionNodes*: cstring = "status.interaction.interactionModes"
    ## Holds the current engine interaction mode. The value is of type
    ## `TxInteractionModes <#TxInteractionModes>`_.
