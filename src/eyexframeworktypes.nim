# *io-tobii* - Nim bindings for the Tobii EyeX eye tracking SDK.
#
# This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
# See the file LICENSE included in this distribution for licensing details.
# GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

type
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
