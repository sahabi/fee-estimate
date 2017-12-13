# Phase 1 Plan

- [ ] Implement the fee estimation algorithms
    - [ ] Implement a process that keeps the estimation bucket for 0.14 updated.
    - [ ] Implement the fee estimation algorithm for 0.14.
    - [ ] Implement a process that keeps the estimation bucket for 0.15 updated.
    - [ ] Implement the fee estimation algorithm for 0.15.

- [ ] Develop a user interface in the form of a website that allows the user to interact with the algorithms by adjusting parameters and observing the effect graphically.

## Implement a process that keeps the estimation bucket for 0.14 updated.

- [x] build a priodic process for updating the fee buckets:
  
  forever:
  - [ ] fetch the height of the last checked block from the db table
  - [ ] fetch the most recent block from RPC
  - [ ] fetch the mempool from RPC
  - [ ] fetch the unconfirmed tx from db table
  - [ ] is the most recent block is heigher than the last checked block?
    - [ ] if yes:
      - [ ] any transaction in the unconf tx was confirmed in the most recent block?
        - [ ] if yes: 
          - [ ] update bucket with the new confirmed transactions
          - [ ] update bucket with the new uncofirmed transactions
        - [ ] if no: pass
      - [ ] update the height of the last checked block db table 
  - [ ] delete mempool tx db table enteries
  - [ ] insert new mempool unconfirmed tx to db table
