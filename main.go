package main

import (
	"github.com/btcsuite/btcd/wire"
)

func NewTx() (*wire.MsgTx, error) {
	return wire.NewMsgTx(wire.TxVersion), nil
}
