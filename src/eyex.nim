## *io-tobii* - Nim bindings for the Tobii EyeX eye tracking SDK.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

{.deadCodeElim: on.}


const
  txEnumStartValue* = 1
  txInternalEnumStartValue* = 10000000
  txFlagsNoneValue* = 0

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

var # State literals
  txSharedLiteralStatePath*: cstring = "StatePath"

var  # Snapshot Literals
  txSharedLiteralWindowIds*: cstring = "WindowIds"
  txSharedLiteralInteractors*: cstring = "Interactors"
  txSharedLiteralMetadata*: cstring = "Metadata"
  txSharedLiteralSerialNumber*: cstring = "SerialNumber"
  txSharedLiteralMessageType*: cstring = "MessageType"
  txSharedLiteralWindowId*: cstring = "WindowId"
  txSharedLiteralCommandType*: cstring = "CommandType"
  txSharedLiteralIsVisible*: cstring = "IsVisible"

var # Callback Response Literals
  txSharedLiteralNotificationType*: cstring = "NotificationType"

var # Interactor Literals
  txSharedLiteralBehaviorType*: cstring = "BehaviorType"
  txSharedLiteralBehaviors*: cstring = "Behaviors"
  txSharedLiteralParentId*: cstring= "ParentId"
  txSharedLiteralInteractorId*: cstring = "InteractorId"
  txSharedLiteralIsEnabled*: cstring = "IsEnabled"
  txSharedLiteralIsDeleted*: cstring = "IsDeleted"
  txConnectionTokenGetVersion*: cstring = "GET_VERSION"
  txConnectionTokenGetMinorVersion*: cstring = "GET_MINORVERSION"
  txConnectionTokenConnect*: cstring = "CONNECT"
  txConnectionTokenClientVersion*: cstring = "CLIENT_VERSION"
  txConnectionTokenClientMode*: cstring = "CLIENT_MODE"
  txConnectionTokenClientId*: cstring = "CLIENT_ID"
  txConnectionTokenLiteralList*: cstring = "LITERAL_LIST";


type # Framework types
  TxResult* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all result codes returned by the API functions
    unknown = txEnumStartValue, ## Unknown error, typically returned if something
      ## unexpected occurs in the API. Is most likely a bug in the API
    ok, ## Everything went well
    eyexNotInitialized, ## The EyeX client environment is not initalized. All API
      ## functions except txInitializeEyeX requires the EyeX client environment to
      ## be initialized prior to being called
    eyexAlreadyInitialized, ## The EyeX client environment has already been
      ## initialized. This is returned by txInitializeEyeX if called twice without
      ## being uninitialized in between
    eyexStillInUse, ## The EyeX client environment is still in use. This is
      ## returned by txUninitializeEyeX if at least one context is still being
      ## used
    invalidArgument, ## An invalid argument was passed to an API function. All
      ## arguments are checked before an API function actually does something.
      ## There are many reasons why an argument can be considered invalid. Check
      ## the log for more details if this code is returned
    invalidHandle, ## The handle for an interaction object is not valid
    notFound, ## Generic result code when something could not be found
    invalidBufferSize, ## Some buffer; string, array, etc. had an invalid size.
      ## Typically, API functions that return this result code also provides the
      ## required size
    duplicateProperty, ## An attempt has been made to create a property that does
      ## already exist
    duplicateBounds, ## An attempt has been made to create bounds that already
      ## exists
    duplicateBehavior, ## An attempt has been made to create a behavior that
      ## already exists
    duplicateInteractor, ## An attempt has been made to create an interactor with
      ## the same id as another in the same snapshot
    duplicateStateObserver, ## An attempt has been made to register the same
      ## state observer twice
    duplicateMask, ## An attempt has been made to create more than one mask on an
      ## interactor
    invalidPropertyType, ## A type specific operation has been made on a property
      ## of a different type. For example a property containing a TxInteger has
      ## been requested for its value as a TxString
    invalidPropertyName, ## The specified property name is invalid
    propertyNotRemovable, ## An attempt has been made to remove a property that
      ## is not removable. Typically such properties are the ones backing up data
      ## that is required on different interaction objects
    notConnected, ## An attempt was made to perform an operation that requires a
      ## valid connection to the client
    invalidObjectCast, ## A handle for a different type of interaction object
      ## than expected was provided
    invalidThread, ## An attempt was made to perform an operation on a thread
      ## that is not allowed to perform such an operation. For example a context
      ## can not be deleted on a callback from the API
    invalidBoundsType, ## An attempt was made to perform an operation that does
      ## not apply to the current bounds type
    invalidBehaviorType, ## An attempt was made to perform an operation that does
      ## not apply to the current behaviour type
    objectLeakage, ## A leakage of an interaction object has been detected. May
      ## be returned by a successful txReleaseContext call where some object were
      ## not released properly
    objectTrackingNotEnabled, ## An attempt to retrieve tracked object has been
      ## made without tracking of objects being enabled
    invalidSnapshot, ## The snapshot committed to the client contained some
      ## invalid data
    invalidCommand, ## The submitted command was malformed or not recognized by
      ## the client
    cancelled, ## An attempt has been made to perform an operation that is not
      ## supported during shutdown
    invalidSchedulingMode, ## The scheduling mode is invalid
    maskTooLarge, ## The supplied mask is too large, width*height must be less
      ## than 65536
    invalidEyeTrackerState ## The submitted command can not be executed in the
      ## current state of the eye tracker


  TxInteractionObjectType* {.pure, size: sizeof(cint).} = enum
    ##  Enumeration for all the types of interaction objects that can be exposed
    ## through the API
    snapshot = txEnumStartValue, ## The object is a snapshot
    interactor, ## The object is an interactor
    query, ## The object is a query
    event ## The object is an event,
    behavior, ## The object is a behavior
    bounds, ## The object is a bounds structure
    propertyBag, ## The object is a property bag
    command, ## The object is a command
    stateBag, ## The object is a state bag
    notification, ## The object is a notification
    mask, ## The object is a mask
    asyncData,
    internalMessage = txInternalEnumStartValue, ## for internal use only
    internalMessageHeader ## for internal use only


  TxMessageType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all message types.
    ## The messages type is metadata contained by all packets sent between the
    ## client and server. Some messages should be handled by the application to do
    ## proper interaction, others are internal and should be ignored.
    query = txEnumStartValue, ## Message contains a query
    event, ## Message contains an event
    notification = txInternalEnumStartValue, ## Message contains a notification
      ## (for internal use only)
    request, ## Message contains a request (for internal use only)
    response, ## Message contains a response (for internal use only)
    custom ## Base value for custom message defined by other protocols


  TxNotificationType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all notification types.
    ##
    ## The notification type is metadata contained by all notifications to specify
    ## what kind of notification it is.
    stateChanged = txEnumStartValue, ## Notifies that some states have changed
    diagnosticData


  TxBehaviorType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all behavior types.
    ##
    ## The behavior type is metadata contained by all behaviors to specify what
    ## kind of behavior it is.
    gazePointData = txEnumStartValue, ## Behavior used on interactors to receive
      ## gaze point data
    eyePositionData, ## Behavior used on interactors to receive eye position data
    gazeAware, ## Behavior used on interactors to perform gaze-aware interaction
    activatable, ## Behavior used on interactors to perform activation interaction
    pannable, ## Behavior used on interactors to perform panning interaction
    fixationData, ## Behavior used on interactors to receive fixation data
    rawGazeData = txInternalEnumStartValue, ## for internal use only
    zoomable, ## for internal use only
    gazeDataDiagnostics ## for internal use only


  TxBoundsType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all bounds types.
    none = txEnumStartValue, ## No bounds
    rectangular ## Rectangular bounds


  TxActivatableEventType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all activation event types.
    activated = txEnumStartValue, ## The interactor has been activated
    activationFocusChanged ## The activation focus and/or tentative activation
      ## focus has changed


  TxFailedActionType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all action data types.
    activationNoHit = txEnumStartValue, ## An activation action did not hit any
      ## valid interactor
    panNoHit, ## A pan action did not hit any valid interactor
    zoomNoHit, ## A zoom action did not hit any valid interactor
    activationDuringNoTracking, ## An activation action occured when there was no
      ## tracking
    panDuringNoTracking, ## A pan action occured when there was no tracking
    zoomDuringNoTracking, ## A zoom action occured when there was no tracking
    activationSmallItems ## for internal use only


  TxFixationDataEventType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all fixation data event types.
    ##
    ## Fixation event type is metadata contained by all behaviors of type
    ## `TxBehaviorType.fixation <#TxBehaviorType>`_ sent from the client. This
    ## event type specifies what kind of fixation event actually happened.
    begin = txEnumStartValue, ## The fixation has begun. The gaze point data
      ## provided is a combination of the gaze points used to detect the fixation.
      ## The timestamp will reflect when the fixation actually began.
    end, ## The fixation has ended. The last valid gaze point is provided. The
      ## timestamp will reflect when the fixation actually ended.
    data ## The fixation is still occuring. A new, filtered gaze point within the
      ## fixation is provided.


  TxGazePointDataMode* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all gaze point data modes.
    ##
    ## The gaze point data mode is metadata contained by all behaviors of type
    ## `TxBehaviorType.gazePointData <#TxBehaviorType>`_. When put on an
    ## interactor it specifies what kind of filter to use by the engine when
    ## calculating the gaze points. When put on an event it specifies what kind of
    ## filter that was used by the engine.
    unfiltered = txEnumStartValue, ## No filter will be applied to the gaze points
      ## (note though that invalid gaze points are discarded)
    lightlyFiltered ## A light filter was/will be applied to the gaze point data.
      ## It is not a simple smoothing filter, it aims to be smooth but responsive.
      ## This should be you default choice for gaze point data.


  TxGazeAwareMode* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all gaze aware modes.
    ##
    ## The gaze aware mode is metadata contained by all behaviors of type
    ## `TxBehaviorType.gazeAware <#TxBehaviorType>`_. When put on an interactor it
    ## specifies how the user must gaze on the interactor to make it gaze aware.
    ## When put on an event it specifies what kind of mode that was used by the
    ## engine.
    normal = txEnumStartValue, ## The interactor will get a gaze aware event when
      ## the engine considers the user to intentionally look at it
    delayed ## The interactor will get a gaze aware event when the engine considers
      ## the user to have looked at it for a specified amount of time. When using
      ## this mode TX_GAZEAWAREPARAMS needs have the field DelayTime set.


  TxFixationDataMode* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all fixation data modes.
    ##
    ## The fixation data mode is metadata contained by all behaviors of type
    ## `TxBehaviorType.fixation <#TxBehaviorType>`_. When put on an interactor it
    ## specifies what kind of filter to use by the engine when finding fixations.
    ## When put on an event it specifies what kind of filter that was used by the
    ## engine.
    sensitive = txEnumStartValue, ## Very sensitive fixation filter, will result in
      ## many fixations, sometimes very close and in quick succession
    slow ## Fairly sensitive to enter fixation but can be slow to exit, as it
      ## tries merge fixations close to each other. Will result in fairly stable
      ## fixations but fixation end events may be coming rather late in certain
      ## circumstances.


  TxEyeTrackingDeviceStatus* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all eye tracking device statuses.
    initializing = txEnumStartValue, ## The eye tracking device is initializing
    notAvailable, ## There is no eye tracking device available
    invalidConfiguration, ## The eye tracking device has an invalid configuration
    deviceNotConnected, ## The eye tracking device is not connected
    tracking, ## The eye tracking device is currently tracking
    trackingPaused, ## The eye tracking device is paused
    configuring, ## The eye tracking device is being configured
    unknownError, ## Unknown error
    connectionError ## The eye tracking device is connected to USB port but EyeX
      ## Engine can not connect to it


  TxCommandType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all command types (for internal use only).
    executeAction = txEnumStartValue, 
    setState,
    getState, 
    registerStateObserver, 
    unregisterStateObserver,
    commitSnapshot, 
    enableBuiltinKeys,
    disableBuiltinKeys, 
    clientConnection,
    launchEyeTrackingControlPanel, ## Deprecated 
    registerQueryHandler, 
    unregisterQueryHandler,
    diagnosticsRequest, 
    launchConfigurationTool


  TxActionType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all action types.
    ##
    ## An action is a way to interact with the EyeX Engine in addition or instead
    ## of the default key bindings that normally executes gaze actions.
    activate = txEnumStartValue, ## Activates an interactor. This corresponds to a
      ## click on the activation button
    activationModeOn, ## Turns on activation mode. This corresponds to pressing the
      ## activation button
    activationModeOff, ## Turns off activation mode. This corresponds to releasing
      ## the activation button
    panningBegin, ## Begins a panning. This corresponds to pressing the panning
      ## button
    panningEnd, ## Ends a panning. This corresponds to releasing the panning button
    panningStep, ## Performs a panning step action. This corresponds to a click on
      ## the panning button
    zoomIn, ## Not yet supported
    zoomOut, ## Not yet supported
    panningToggleHandsFree ## Not yet supported


  TxPannableEventType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all pannable event types.
    ##
    ## Pannable event type are metadata contained by all behaviors of type
    ## `TxBehaviorType.pannable <#TxBehaviorType>`_ sent from the client. This
    ## event type specifies what kind of pannable event actually happened.
    pan = txEnumStartValue, ## The interactor has been panned
    step, ## The interactor has been stepped
    handsFree ## Not yet supported


  TxPanDirection* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration flags for all pannable directions.
    ##
    ## Governs available directions to pan for a pannable interactor. The
    ## directions are bitwise combinable.
    none = txFlagsNoneValue, ## No pandirection available
    left = 1, ## Panning to the left available
    right = 1 shl 1, ## Panning to the right available
    up = 1 shl 2, ## Panning up available
    down = 1 shl 3, ## Panning down available
    all = (1 shl 4) - 1 ## All pan directions available


  TxPanningProfile* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all panning profiles.
    none = txEnumStartValue, ## No panning profile
    reading, ## Panning profile for reading, currently same as `vertical`. Will be
      ## available in subsequent versions
    horizontal, ## Left and right only panning profile
    vertical, ## Up and down only panning profile
    verticalFirstThenHorizontal, ## Up, down, left and right, with emphasis on
      ## vertical panning
    radial, ## Panning in any direction
    horizontalFirstThenVertical ## Up, down, left and right, with emphasis on
      ## horizontal panning


  TxUserPresence* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for convery presence status.
    present = txEnumStartValue, ## A user is present in front of the eye tracker
    notPresent ## A user is not present in front of the eye tracker


  TxRequestType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all the types of requests that can be exposed through the
    ## API.
    command = txEnumStartValue, ## The request handles a command 
    custom = txInternalEnumStartValue ## Base value for custom requests defined by
      ## other protocols


  TxMaskType* {.pure, size: sizeof(cint).} = enum ## \
    ##  Enumeration for mask types.
    default = txEnumStartValue ## Default mask type


  TxInteractionModes* {.size: sizeof(cint).} = enum ## \
    ## Flags for describing engine interaction modes. These influence what
    ## behaviors are being treated and what interaction behavior events are being
    ## generated.
    none = txFlagsNoneValue, ## Engine is not in any specific interacion mode, gaze
      ## aware behaviors and data stream behaviors are being treated only
    activationMode = 1, ## Engine is in activation mode, meaning activatable
      ## interactors are prioritized and tentative activation focus events are
      ## being generated
    panningMode = 1 shl 2 ## Engine is in panning mode, meaning pannable interactors
      ## are being prioritzed, and approperitate events being generated


  TxClientMode* {.pure, size: sizeof(cint).} = enum
    agent = txEnumStartValue,
    diagnostics


  TxConfigurationTool* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for configuration tools.
    eyexSettings = txEnumStartValue, ## EyeX Settings (always available)
    recalibrate, ## Re-Calibrate the current profile. Available when the following
      ## is fulfilled:
      ## - Eye Tracking Device Status is "tracking" or "InvalidConfiguration"
      ## - Eye Tracking Configuration Status is "Valid" or "InvalidCalibration"
      ## - State TX_STATEPATH_PROFILENAME has a value other than empty string
      ##
      ## When the Recalibrate tool is active the Eye Tracking Device Status will be
      ## "Configuring", i.e. tracking is off.
    guestCalibration, ## Create and calibrate a guest profile and set it as active
      ## profile. Available when the following is fulfilled:
      ## - Eye Tracking Device Status is "Tracking" or "InvalidConfiguration"
      ## - Eye Tracking Configuration Status is "Valid" or "InvalidCalibration"
      ##
      ## When the Guest Calibration tool is active the Eye Tracking Device Status
      ## will be "Configuring", i.e. tracking is off.
    createNewProfile, ## Create and calibrate a new profile and set it as active
      ## profile. Available when the following is fulfilled:
      ## - Eye Tracking Device Status is "Tracking" or "InvalidConfiguration"
      ## - Eye Tracking Configuration Status is "Valid" or "InvalidCalibration".
      ##
      ## When the Create New Profile tool is active the Eye Tracking Device Status
      ## will be "Configuring", i.e. tracking is off.
    testEyeTracking, ## Test your eye tracking. Available when the following is
      ## fulfilled:
      ## - Eye Tracking Device Status is "Tracking"
    setupDispaly = txInternalEnumStartValue, ## For internal use only
    eyePosition ## For internal use only


  TxEyeTrackingConfigurationStatus* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for configuration status.
    ##
    ## Gives information about the configuration status of the eye tracker, for
    ## example if it needs to be calibrated or if we need to setup display. Can be
    ## used as input to determine when to enable launching of configuration tools,
    ## see `txLaunchConfigurationTool <#txLaunchConfigurationTool>`_ and
    ## `TxConfigurationTool <#TxConfigurationTool>`_.
    valid = txEnumStartValue, ## The configuration status of the eye tracker is
      ## valid
    invalidMonitorConfiguration, ## The monitor where the eye tracker is mounted
      ## need to be configured
    invalidCalibration, ## The eye tracker need to be calibrated. If no user
      ## profile exists (see state `TxStatePath.profileName <#TxStatePath>`_) a new
      ## profile should be created
    unknownError ## The configuration is in an unknown error state


type # Common types
  TxUserParam* = pointer
  TxHandle* = pointer
  TxConstHandle* = pointer
  TxPropertyHandle* = pointer
  TxConstPropertyHandle* = pointer
  TxContextHandle* = pointer
  TxConstContextHandle* = pointer
  TxTicket* = cint
  TxByte* = cuchar
  TxSize* = cint
  TxInteger* = cint
  TxReal* = cdouble
  TxChar* = char
  TxString* = cstring
  TxConstString* = cstring
  TxRawPtr* = pointer
  TxThreadId* = cint

type
  TxBool* {.size: sizeof(cint).} = enum ## \
    ## Boolean return values.
    txFalse = 0,
    txTrue = 1


const
  txEmptyHandle* = 0
  txInvalidTicket* = 0
  txCleanupTimeoutDefault* = 500
  txCleanupTimeoutForceImmediate* = -1

 
type
  TxEyeComponentOverrideFlags* {.pure, pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all client environment component override flags.
    ##
    ## When calling `txInitializeEyeX <#txInitializeEyeX>`_ these flags must be
    ## combined to specify which components should be overridden.
    none = txFlagsNoneValue,  ## No client environment component should be
      ## overridden
    loggingModel = 1 shl 0, ## The logging model should be overridden. The logging
      ## model can be overridden by just specifying some of the standard log
      ## targets (see `TxLgTarget <#TxLgTarget>`_) or by a custom user implemented
      ## log writer.
    internalMemoryModel = 1 shl 1, ## The memory model should be overridden. For
      ## internal use only.
    internalThreadingModel = 1 shl 2, ## The threading model should be overridden.
      ## For internal use only.
    internalSchedulingModel = 1 shl 3 ## The scheduling model should be overridden.
      ## For internal use only.


type 
  TxConnectionState* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all connection states.
    ##
    ## These values are used to notify the application of the current connection
    ## state. To receive these notifications the client needs to subscribe using
    ## `txRegisterConnectionStateChangedHandler <#txRegisterConnectionStateChangedHandler>`_
    ## and then call `txEnableConnection <#txEnableConnection>`_. 
    connected = txEnumStartValue, ## The client is now connected to the client.
    disconnected, ## The client is now disconnected from the client. Unless this
      ## is due to `txDisableConnection <#txDisableConnection>`_ being called the
      ## client will shortly attempt to connect again.
    tryingToConnect, ## The client is now trying to connect to the client. This
      ## is the first state being sent to the application after
      ## `txEnableConnection <#txEnableConnection>`_ has been called.
    serverVersionTooLow, ## The client version is too low. The client is not
      ## connected and will not try to reconnect.
    serverVersionTooHigh ## The client version is too high. The client is not
      ## connected and will not try to reconnect.


type 
  TxLogTarget* {.pure, size: sizeof(cint).} = enum ## \ 
    ## Enumeration for all log targets.
    ##
    ## When overriding the logging model these flags specify which log targets
    ## to use. The flags can be combined.
    none = txFlagsNoneValue, ## No logging should occur at all
    console = 1 shl 0, ## The log message should be written to the console
    trace = 1 shl 1, ## The log messages should be traced (output window in Visual
      ## Studio)
    custom = 1 shl 2 ## The specified `TxLogCallback <#TxLogCallback>`_ should be
      ## invoked for custom logging


type 
  TxLogLevel* {.pure, size: sizeof(cint).} = enum  ## \
    ## Enumeration for all log levels. The log levels are used to indicate the
    ## severity of the message.
    debug = txEnumStartValue, ## The message is just a debug print out typically
      ## used during development
    info, ## The message is plain info and does not indicate that something is
      ## wrong
    warning, ## The message is a warning that indicates that something is not the
      ## way it should, not yet critical
    error ## The message indicates that there is some kind of error


type 
  TxSchedulingMode* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all schedulng modes.
    ##
    ## When overriding the scheduling model the mode specifies which of the
    ## available scheduling modes to use.
    direct = txEnumStartValue, ## All jobs are performed immediately on the thread
      ## that calls them
    userFrame, ## All jobs are performed when
      ## `txPerformScheduledJobs <#txPerformScheduledJobs>`_ is called
    custom ## Whenever a job is to be performed a callback function is invoked
      ## giving the client application full control


type 
  TxPropertyValueType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all property value types.
    empty = txEnumStartValue,  ## The property does not have a value
    objectType, ## The property currently holds an interaction object
    integerType, ## The property currently holds an integer
    realType, ## The property currently holds a real
    stringType, ## The property currently holds a string
    blobType ## The property currently holds a blob


type 
  TxPropertyBagType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for the all Property Bag types.
    objectBag = txEnumStartValue, ## The property is a normal object with named
      ## properties
    arrayBag ## The property bag is an array with sequentially named properties
      ## appearing in the order they where inserted


type 
  TxEyeXAvailability* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for the availability status of the EyeX Engine.
    notAvailable = txEnumStartValue, ## EyeX Engine is not installed on the system
      ## or otherwise not available
    notRunning, ## EyeX Engine is not running
    running ## yeX Engine is running


type # Callbacks
  TxConnectionStateChangedCallback* = proc (state: TxConnectionState,
    userParam: TxUserParam)
    ## Callback for when the connection state is changed.
    ##
    ## state
    ##   Specifies the current state of the connection
    ## userParam
    ##   The user parameter provided to the
    ##   `txRegisterConnectionStateChangedHandler <#txRegisterConnectionStateChangedHandler>`_
    ##   function

  TxAsyncDataCallback* = proc (hAsyncData: TxConstHandle,  userParam: TxUserParam)
    ## Callback for an asynchronous operations.
    ##
    ## hAsyncData
    ##   A handle to the async data.
    ## userParam
    ##   The user parameter provided to the asynchronous operation

   TxThreadWorkerFunction* = proc (threadWorkerParam: TxUserParam)
    ## Function run by a thread.
    ##
    ## threadWorkerParam
    ##   The user parameter provided to the CreateThreadCallback

  TxCreateThreadCallback* = proc (worker: TxThreadWorkerFunction,
    threadWorkerParam: TxUserParam, userParam: TxUserParam): TxThreadId
    ## Callback used to create a thread.
    ##
    ## worker
    ##   Worker function that will be run by the thread
    ## threadWorkerParam
    ##   A user parameter passed to worker function
    ## userParam
    ##   The user parameter provided by the TX_THREADINGMODEL structure
    ## result
    ##   The ID of the created thread

  TxGetCurrentThreadIdCallback* = proc (userParam: TxUserParam): TxThreadId
    ## Callback used to get the current thread id.
    ##
    ## userParam
    ##   The user parameter provided by the
    ##   `TxThreadingModel <#TxThreadingModel>`_ structure
    ## result
    ##   The ID of the current thread

  TxJoinThreadCallback* = proc (threadId: TxThreadId, userParam: TxUserParam):
    TxBool
    ## Callback used to join a thread
    ##
    ## threadId
    ##   The id of the thread to join
    ## userParam
    ##   The user parameter provided by the
    ##   `TxThreadingModel <#TxThreadingModel>`_ structure
    ## result
    ##   - `txTrue <#TxBool>`_ if the thread was successfully joined
    ##   - `txFalse <#TxBool>`_ on non existing thread

  TxDeleteThreadCallback* = proc (threadId: TxThreadId, userParam: TxUserParam):
    TxBool
    ## Callback used to delete a thread.
    ##
    ## threadId
    ##   The ID of the thread to be deleted
    ## userParam
    ##   The user parameter provided by the
    ##   `TxThreadingModel <#TxThreadingModel>`_ structure
    ## result
    ##   - `txTrue <#TxBool>`_ if the thread was successfully deleted
    ##   - `txFalse <#TxBool>`_ otherwise

  TxDeleteModelCallback* = proc (userParam: TxUserParam)
    ## Callback used to release a threading model or a logging model.
    ##
    ## userParam
    ##   Normally used for capture outside the scope of the callback

  TxAllocatorFunction* = proc (length: TxInteger)
    ## Allocator function, used to override allocation of memory.
    ##
    ## length
    ##   Size in bytes of the requested memory block

  TxLogCallback* = proc (level: TxLogLevel, scope TxConstString,
    message: TxConstString, userParam: TxUserParam)
    ## Callback for logging.
    ##
    ## level
    ##   The level of log message, see TX_LOGLEVEL for levels
    ## scope
    ##   A string token representing from which part the log message was originated
    ## message
    ##   The message to be logged
    ## userParam
    ##   The user parameter provided by the `TxLoggingModel <#TxLoggingModel>`_
    ##   structure
    ##
    ## If a custom logging model is set, see `TxLoggingModel <#TxLoggingModel>`_,
    ## this callback will be invoked when a log message is written by the API.

  TxPerformJobFunction* = proc (jobParam: TxUserParam)
    ## Function provided by the API when a job is scheduled.
    ##
    ## jobParam
    ##   The user parameter provided by the API when a job is scheduled

  TxScheduleJobCallback* = proc (performJob: TxPerformJobFunction,
    jobParam: TxUserParam, userParam: TxUserParam)
    ## Callback for scheduling a job.
    ##
    ## performJob
    ##   The function to invoke when the job is to be performed
    ## jobParam
    ##   A parameter used to provide a context to the job
    ## userParam
    ##   The user parameter provided to the
    ##   `TxSchedulingModel <#TxSchedulingModel>`_
    ##
    ## If a custom scheduling model is set, see
    ## `TxSchedulingModel <#TxSchedulingModel>`_, this callback will be invoked
    ## when a job is to be scheduled.


type # Structs
  TxRect* = object
    ## Struct for a rectangle.
    x: TxReal ## The X coordinate for the upper left corner of the rectangle
    y: TxReal ## The Y coordinate for the upper left corner of the rectangle
    width: TxReal ## The width of the rectangle
    height: TxReal ## The height of the rectangle

  TxVector2* = object
    ## Struct for 2D vector.
    x: TxReal ## The X coordinate of the vector
    y: TxReal ## The Y coordinate of the vector

  TxSize2* = object
    ## Struct for 2D size.
    width: TxReal ## The width of the size
    height: TxReal ## The height of the size

  TxPannableParams* = object
    ## Struct for pannable behavior parameters.
    isHandsFreeEnabled: TxBool ## Set to false (hands free panning is not yet
      ## implemented)
    profile: TxPanningProfile ## The panning profile
    peakVelocity: TxReal ## Currently not used
    panDirectionsAvailable: TxPanDirection ## Flags specifying which pan directions
      ## are currently possible. Correct pan direction flags are needed for panning
      ## to work properly.

  TxPannablePaneEventParams* = object
    ## Struct for pannable pan event parameters.
    panVelocityX: TxReal ## The X velocity for the pan. In pixels per second
    panVelocityY: TxReal ## The Y velocity for the pan. In pixels per second

  TxPannableStepEventParams* = object
    ## Struct for pannable step event parameters.
    panStepX: TxReal ## The step length on the X axis in pixels
    panStepY: TxReal ## The step length on the X axis in pixels
    panStepDuration: TxReal ## The amount of time in seconds during which the step
      ## should be performed

  TxPannableHandsFreeEventParams* = object
    ## Struct for pannable hands free event parameters.
    handsFreeEnabled: TxBool ## Specifies if hands free panning is enabled or not

  TxGazeAwareParams* = object
    ## Struct for gaze aware parameters.
    gazeAwareMode: TxGazeAwareMode ## Specifies the gaze aware mode
    delayTime: TxReal ## Specifies the amount of time in milliseconds that the user
      ## has to look at an interactor before a gaze aware event is sent. This value
      ## only has an effect if the mode is set to `delayed <#TxGazeAwareMode>`_.

  TxGazeAwareEventParams* = object
    ## Struct for gaze aware event parameters.
    hasGaze: TxBool ## Specifies if the interactor currently has gaze on it

  TxActivationFocusChangedEventParams* = object
    ## Struct for activation focus changed Params.
    hasTentativeActivationFocus: TxBool ## Specifies if the interactor currently
      ## has tentative activation focus
    hasActivationFocus: TxBool ## Specifies if the interactor currently has
      ## activation focus

  TxGazePointDataParams* = object
    ## Struct for gaze point data behavior parameters.
    gazePointDataMode: TxGazePointDataMode ## Specifies the gaze point data mode

  TxFixationDataParams* = object
    ## Struct for fixation behavior parameters.
    fixationDataMode: TxFixationDataMode ## Specifies the fixation data mode

  TxFixationDataEventParams* = object
    ## Struct for fixation behavior event parameters.
    fixationDataMode: TxFixationDataMode ## The fixation data mode
    eventType: TxFixationDataEventType ## The type of fixation event
    timestamp: TxReal ## For
      ## `TxFixationDataEventType.begin <#TxFixationDataEventType>`_, this is the
      ## time when the fixation started, in milliseconds. For
      ## `TxFixationDataEventType.end <#TxFixationDataEventType>`_, this is the
      ## time when the fixation ended, in milliseconds. For
      ## `TxFixationDataEventType.data <#TxFixationDataEventType>`_, the timestamp
      ## for the filtered gaze point provided within the current fixation, when the
      ## filter was applied, in milliseconds.
    x: TxReal ## The current X coordinate of the fixation in pixels. For begin and
      ## end events will reflect where the fixation began or ended.
    y: TxReal ## The current Y coordinate of the fixation in pixels. For begin and
      ## end events will reflect where the fixation began or ended.

  TxGazePointDataEventParams* = object
    ## Struct for gaze point data behavior event parameters.
    gazePointDataMode: TxGazePointDataMode ## The gaze point data mode
    timestmap: TxReal ## For
      ## `TxGazePointDataMode.lightlyFiltered <#TxGazePointDataMode>`_ this is the
      ## point in time when the filter was applied, in milliseconds. For
      ## `TxGazePointDataMode.unfiltered <#TxGazePointDataMode>`_ this is the point
      ## in time time when gaze point was captured, in milliseconds.
    x: TxReal ## The X coordinate of the gaze point in pixels
    y: TxReal ## The Y coordinate of the gaze point in pixels

  TxEyePositionDataEventParams* = object
    ## Struct for eye position data behavior event parameters.
    timestamp: TxReal ## The point in time when the eye position was captured, in
      ## milliseconds
    hasLeftEyePosition: TxBool ## Whether the data for the left eye is valid
    hasRightEyePosition: : TxBool ## Whether the data for the right eye is valid
    leftEyeX: TxReal ## The X coordinate of the left eye in millimetres
    leftEyeY: TxReal ## The Y coordinate of the left eye in millimetres
    leftEyeZ: TxReal ## The Z coordinate of the left eye in millimetres
    leftEyeXNormalized: TxReal ## The X coordinate of the left eye normalized in
      ## the track box
    leftEyeYNormalized: TxReal ## The Y coordinate of the left eye normalized in
      ## the track box
    leftEyeZNormalized: TxReal ## The Z coordinate of the left eye normalized in
      ## the track box
    rightEyeX: TxReal ## The X coordinate of the right eye in millimetres
    rightEyeY: TxReal ## The Y coordinate of the right eye in millimetres
    rightEyeZ: TxReal ## The Z coordinate of the right eye in millimetres
    rightEyeXNormalized: TxReal ## The X coordinate of the right eye normalized in
      ## the track box
    rightEyeYNormalized: TxReal ## The Y coordinate of the right eye normalized in
      ## the track box
    rightEyeZNormalized: TxReal ## The Z coordinate of the right eye normalized in
      ## the track box
      
  TxThreadingModel* = object
    ## Struct for the threading model.
    createThread: TxCreateThreadCallback ## Callback function used to create a
      ## thread
    getCurrentThreadId: TxGetCurrentThreadIdCallback ## Callback function used to
      ## get the id of the current (calling) thread
    joinThread: TxJoinThreadCallback ## Callback function used to join a thread
    deleteThread: TxDeleteThreadCallback ## Callback function used to delete a
      ## thread
    deleteModel: TxDeleteModelCallback ## Callback function used to release the
      ## threading model
    userParam: TxUserParam ## User parameter which will be passed to the functions

  TxLoggingModel* = object
    ## Struct for the logging model.
    targets: TxLogTarget ## Specifies which log targets to use
    log: TxLogCallback ## Callback function used to write a custom log message
    deleteModel: TxDeleteModelCallback ## Callback function used to release the
      ## logging model
    userParam: TxUserParam ## User parameter which will be passed to the custom log
      ## function

  TxSchedulingModel* = object
    ## Struct for the scheduling model.
    mode: TxSchedulingMode ## Specifies which scheduling mode to use
    scheduleJob: TxScheduleJobCallback ## Callback function schedule a work item
    deleteModel: TxDeleteModelCallback ## Callback function used to release the
      ## scheduling model
    userParam: TxUserParam ## User parameter which will be passed to the custom
      ## schedule function


# Enviroment
# Context
# Object
# Async Data
# Utils
# Snapshot
# Bounds
# Interactor
# CommandType
# Actions
# Behavior
# States
# Notification
# Query
# Event
# Property
  