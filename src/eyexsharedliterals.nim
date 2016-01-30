# *eyex* - Nim bindings for the Tobii EyeX eye tracking SDK.
#
# This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
# See the file LICENSE included in this distribution for licensing details.
# GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

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
