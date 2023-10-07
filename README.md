# settlement-service

## Overview

This is a go service that runs as a cron job to settle the transactions in the database. It uses crontab to run the service every 5 minutes. The service will settle all the transactions that are in the database and have a status of `confirmed` for payin and `pending` for payout. The service will also update the settlment state of the transactions to `settled`.

## TODO

1. Mark pending debit transactions older than 24 hours as failed
