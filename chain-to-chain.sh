global:
    api-listen-addr: :5183
    timeout: 10s
    memo: ""
    light-cache-size: 20
chains:
    skcd:
        type: cosmos
        value:
            key: ibc_user
            chain-id: skcd
            rpc-addr: http://localhost:26657
            account-prefix: sku
            keyring-backend: test
            gas-adjustment: 1.5
            gas-prices: 0.0token
            min-gas-amount: 0
            debug: true
            timeout: 10s
            output-format: json
            sign-mode: direct
    chain1:
        type: cosmos
        value:
            key: ibc_user1
            chain-id: chain1
            rpc-addr: http://localhost:26659
            account-prefix: sku
            keyring-backend: test
            gas-adjustment: 1.5
            gas-prices: 0.0token
            min-gas-amount: 0
            debug: true
            timeout: 10s
            output-format: json
            sign-mode: direct

    chain2:
        type: cosmos
        value:
            key: ibc_user2
            chain-id: chain2
            rpc-addr: http://localhost:26660
            account-prefix: sku
            keyring-backend: test
            gas-adjustment: 1.5
            gas-prices: 0.0token
            min-gas-amount: 0
            debug: true
            timeout: 10s
            output-format: json
            sign-mode: direct
paths:
    chain1-chain2:
        src:
            chain-id: chain1
        dst:
            chain-id: chain2
        src-channel-filter:
            rule: ""
            channel-list: []
    skcd-chain1:
        src:
            chain-id: skcd
        dst:
            chain-id: chain1
        src-channel-filter:
            rule: ""
            channel-list: []
    skcd-chain2:
        src:
            chain-id: skcd
        dst:
            chain-id: chain2
        src-channel-filter:
            rule: ""
            channel-list: []