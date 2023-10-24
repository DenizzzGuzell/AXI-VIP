MASTER_AGT_HOME=$(shell pwd)/../master_agt_top
SLAVE_AGT_HOME=$(shell pwd)/../slave_agt_top
TB_HOME=$(shell pwd)/../tb
RTL_HOME=$(shell pwd)/../rtl
SIM_HOME=$(shell pwd)
TEST_HOME=$(shell pwd)/../test
ENV_HOME=$(shell pwd)/../env
LIST_HOME=$(shell pwd)/list
LOG_HOME=$(shell pwd)/log

MA_SIM_FLIST=$(LIST_HOME)/master_agt_sim.flist
SA_SIM_FLIST=$(LIST_HOME)/slave_agt_sim.flist
TB_SIM_FLIST=$(LIST_HOME)/testbench_sim.flist
TEST_SIM_FLIST=$(LIST_HOME)/test_sim.flist
ENV_SIM_FLIST=$(LIST_HOME)/env_sim.flist
RTL_SIM_FLIST=$(LIST_HOME)/rtl_sim.flist

SIM_EXEC_NAME = axi_test

VCS=vcs
VCS_OPTS=-nc -full64 -sverilog -ntb_opts uvm-1.1 -debug_access+all+f -lca +warn=all +lint=all,noVCDE,noNS +vcs+vcdpluson -sva_bind_enable -o $(SIM_EXEC_NAME)

VLOG=vlogan
VLOG_COMMON_OPTS=-full64 -ntb_opts uvm-1.1 +define+UVM_HDL_MAX_WIDTH=128 +v2k -timescale=1ns/1ps -nc
VLOG_OPTS=-sverilog

all : clean setup compile_testbench elaborate sim_rtl

sim_rtl:
	./$(SIM_EXEC_NAME) +UVM_NO_RELNOTES -gui +ntb_random_seed_automatic +UVM_TESTNAME=axi_test -l $(LOG_HOME)/simulate.log

elaborate:
	$(VCS) $(VCS_OPTS) top -l $(LOG_HOME)/elaborate.log

compile_testbench: compile_interface
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) $(TB_HOME)/top.sv

compile_interface: compile_pkg
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) $(RTL_HOME)/axi_interface.sv

compile_pkg: compile_rtl
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) +incdir+$(MASTER_AGT_HOME) $(MASTER_AGT_HOME)/master_agent_pkg.sv
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) +incdir+$(SLAVE_AGT_HOME) $(SLAVE_AGT_HOME)/slave_agent_pkg.sv
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) +incdir+$(ENV_HOME) $(ENV_HOME)/env_pkg.sv
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) +incdir+$(TEST_HOME) $(TEST_HOME)/axi_test_pkg.sv

compile_rtl: compile_uvm
	$(VLOG) $(VLOG_COMMON_OPTS) $(VLOG_OPTS) $(RTL_HOME)/axi_interface.sv

compile_uvm:
	$(VLOG) -full64 -sverilog -ntb_opts uvm-1.1 -nc

setup:
	mkdir -p $(LOG_HOME)

clean:
	rm -rf AN.DB csrc logs/* *simv.daidir vc_hdrs.h vcs_lib *simv DVEfiles ucli.key *.vpd *.vcd .restartSimSession.tcl.old .synopsys_dve_rebuild.tcl
