New-NetFirewallRule -DisplayName "UDP 7777" `
                    -Direction Outbound 
                    -LocalPort 27015 `
                    -Protocol UDP `
                    -Action All





New-NetFirewallRule -DisplayName "Allow7777udp" `
                    -Direction Outbound `
                    -LocalPort 27015 `
                    -Protocol UDP `
                    -Action Allow


New-NetFirewallRule -DisplayName "TFTP" -Direction Outbound-LocalPort 69 -Protocol UDP -Action Allow
