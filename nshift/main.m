// Copyright 2017 Jenghis
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"

int main(int argc, const char * argv[]) {
    if (argc == 1) { return 0; }
    
    NSString *command = [NSString stringWithUTF8String:argv[1]];
    CBBlueLightClient *client = [[CBBlueLightClient alloc] init];
    
    if ([command isEqualToString:@"enable"]) {
        [client setEnabled:true];
    } else if ([command isEqualToString:@"disable"]) {
        [client setEnabled:false];
    } else {
        float strength = [command floatValue] / 100;
        
        if (strength != 0.0) { [client setStrength:strength commit:true]; }
        [client setEnabled:(strength != 0.0)];
    }
    
    return 0;
}
