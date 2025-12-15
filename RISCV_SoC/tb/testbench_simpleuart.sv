module testbench_simpleuart;
    // clock / reset    
    logic clk = 1;
    logic resetn = 0;

    //simpleuart interface
	logic        ser_tx;
	logic        ser_rx;

	logic [ 3:0]  reg_div_we;
	logic [31:0] reg_div_di;
	logic [31:0] reg_div_do;

	logic         reg_dat_we;
	logic         reg_dat_re;
	logic [31:0]  reg_dat_di;
	logic [31:0]  reg_dat_do;
	logic         reg_dat_wait;

    //set up clock and reset
    always #5 clk = ~clk;

    initial begin 
        clk = 0;
        resetn = 0;

        ser_rx = 1;

        reg_div_we = 4'b1111;
        reg_div_di = 0;

        reg_dat_we = 0;
        reg_dat_re = 0;
        reg_dat_di = 0;

        repeat (5) @(posedge clk);
        resetn <= 1;
        @(posedge clk);
        reg_div_we = 0; //the divider value gets latched. dont hold it high. 
                        //when the divider we is high, nothing else happens
                        //only dummy gets output

        repeat (75) @(posedge clk);

        // ---- Test 1: transmit word ----

        reg_dat_di = 32'b00000000_00000001_01010101_00110011;

        @(posedge clk);
        reg_dat_we = 1;
        @(posedge clk);
        reg_dat_we = 0; //if you set write enable for one clock cycle it's gonna send only the first 8 bits
        // repeat (35) @(posedge clk);
        // @(posedge clk);
        // reg_dat_we = 1; //but then redoing it will once again send only the first 8 bits
        // @(posedge clk);
        // reg_dat_we = 0;
        // repeat (35) @(posedge clk);

        // @(posedge reg_dat_wait);
        // @(posedge clk);
        // reg_dat_we = 0;
        // @(posedge clk);
        // reg_dat_we = 1;

    end

    simpleuart uart (
        .clk        (clk),
        .resetn     (resetn),

        .ser_tx(ser_tx),
        .ser_rx(ser_rx),

        .reg_div_we(reg_div_we),
        .reg_div_di(reg_div_di),
        .reg_div_do(reg_div_do),

        .reg_dat_we(reg_dat_we),
        .reg_dat_re(reg_dat_re),
        .reg_dat_di(reg_dat_di),
        .reg_dat_do(reg_dat_do),
        .reg_dat_wait(reg_dat_wait)
    );


endmodule