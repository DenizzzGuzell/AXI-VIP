# AXI-VIP
Verification IP of fully parameterized AXI4-Lite

## Configuration Parameters
### Agent Configurations
#### Master agent Configuration
no_of_mtr_agts   : Number of master agents

#### Slave agent Configuration
no_of_slv_agts   : Number of slave agents

is_active  : active passive enumerator

### Environment Configuration
has_sb   : Agent has scoreboard

has_v_seqr  : Agent has virtual sequencer

no_of_mtr_agts   : Number of master agents

no_of_slv_agts  : Number of slave agents

no_of_mtops   : Number of master top agent

no_of_stops   : Number of slave top agent

Detailed description of AXI4 can be found in :

[https://en.wikipedia.org/wiki/Serial_Peripheral_Interface](https://en.wikipedia.org/wiki/Advanced_eXtensible_Interface)

## Test Configuration

Configuration of Test:

![image](https://github.com/DenizzzGuzell/AXI-VIP/assets/81621705/17440553-6192-4513-a568-e20a196d2731)

## Test Names and Results
Created test name for writing and reading at the same time is axi_test

## To Do
There is compiler error about multiple object declaration

Assertions and Functional coverages will be added to project.
