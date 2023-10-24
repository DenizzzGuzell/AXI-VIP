package env_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	import master_agent_pkg::*;
	import slave_agent_pkg::*;

	`include "axi_env_config.sv"
	`include "virtual_sequencer.sv"
	`include "axi_virtual_seq.sv"
	`include "axi_scoreboard.sv"
	`include "axi_environment.sv"

endpackage: env_pkg
