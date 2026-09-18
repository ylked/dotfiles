#!/usr/bin/expect -f

set timeout -1

# Access exported shell variables via the global $env array
set username $env(VPN_USERNAME)
set vpn_host $env(VPN_HOSTNAME)

set password [exec op read $env(VPN_AUTH_PASSWORD_ITEM)]
set otp      [exec op read $env(VPN_AUTH_OTP_ITEM)]

spawn sudo openconnect --protocol=anyconnect --useragent=AnyConnect --user=$username $vpn_host

expect {
    "Password:" {
        send "$password\r"
        exp_continue
    }
    "Response:" {
        send "$otp\r"
        exp_continue
    }
    eof
}
