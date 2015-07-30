# *io-tobii* - Nim bindings for the Tobii EyeX eye tracking SDK.
#
# This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
# See the file LICENSE included in this distribution for licensing details.
# GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

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


  TxPropertyValueType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for all property value types.
    empty = txEnumStartValue,  ## The property does not have a value
    objectType, ## The property currently holds an interaction object
    integerType, ## The property currently holds an integer
    realType, ## The property currently holds a real
    stringType, ## The property currently holds a string
    blobType ## The property currently holds a blob


  TxPropertyBagType* {.pure, size: sizeof(cint).} = enum ## \
    ## Enumeration for the all Property Bag types.
    objectBag = txEnumStartValue, ## The property is a normal object with named
      ## properties
    arrayBag ## The property bag is an array with sequentially named properties
      ## appearing in the order they where inserted


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
