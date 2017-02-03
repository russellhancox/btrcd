//
//  AppDelegate.m
//  btrcd
//

#import "AppDelegate.h"

@import MediaPlayer;

#include <IOKit/hidsystem/ev_keymap.h>

@implementation AppDelegate

typedef MPRemoteCommandHandlerStatus (^MPRemoteCommandHandler)(MPRemoteCommandEvent *);

void sendKey(int keyCode, BOOL down) {
  NSEventModifierFlags flags = down ? 0xa00 : 0xb00;
  NSInteger data1 = (keyCode << 16) | ((down ? 0xa : 0xb) << 8);

  NSEvent *ev = [NSEvent otherEventWithType:NSEventTypeSystemDefined
                                   location:NSMakePoint(0, 0)
                              modifierFlags:flags
                                  timestamp:0.0
                               windowNumber:0
                                    context:NULL
                                    subtype:8
                                      data1:data1
                                      data2:-1];
  CGEventPost(0, [ev CGEvent]);
}

MPRemoteCommandHandler makeHandlerForKeyCode(int keyCode) {
  return ^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *ev) {
    sendKey(keyCode, YES);
    sendKey(keyCode, NO);
    return MPRemoteCommandHandlerStatusSuccess;
  };
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  MPRemoteCommandCenter *cc = [MPRemoteCommandCenter sharedCommandCenter];

  [cc.playCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_PLAY)];
  [cc.pauseCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_PLAY)];
  [cc.stopCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_PLAY)];
  [cc.togglePlayPauseCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_PLAY)];
  [cc.nextTrackCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_NEXT)];
  [cc.previousTrackCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_PREVIOUS)];
  [cc.seekForwardCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_FAST)];
  [cc.seekBackwardCommand addTargetWithHandler:makeHandlerForKeyCode(NX_KEYTYPE_REWIND)];
}

@end
