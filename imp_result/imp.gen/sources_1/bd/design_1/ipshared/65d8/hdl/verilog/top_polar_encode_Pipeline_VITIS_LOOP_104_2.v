// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module top_polar_encode_Pipeline_VITIS_LOOP_104_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        src_address0,
        src_ce0,
        src_q0,
        bit_stream_V_address0,
        bit_stream_V_ce0,
        bit_stream_V_we0,
        bit_stream_V_d0,
        data_1_out_i,
        data_1_out_o,
        data_1_out_o_ap_vld,
        count_2_1_out_i,
        count_2_1_out_o,
        count_2_1_out_o_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [11:0] src_address0;
output   src_ce0;
input  [7:0] src_q0;
output  [5:0] bit_stream_V_address0;
output   bit_stream_V_ce0;
output   bit_stream_V_we0;
output  [0:0] bit_stream_V_d0;
input  [7:0] data_1_out_i;
output  [7:0] data_1_out_o;
output   data_1_out_o_ap_vld;
input  [31:0] count_2_1_out_i;
output  [31:0] count_2_1_out_o;
output   count_2_1_out_o_ap_vld;

reg ap_idle;
reg src_ce0;
reg[5:0] bit_stream_V_address0;
reg bit_stream_V_ce0;
reg bit_stream_V_we0;
reg[0:0] bit_stream_V_d0;
reg[7:0] data_1_out_o;
reg data_1_out_o_ap_vld;
reg[31:0] count_2_1_out_o;
reg count_2_1_out_o_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln104_fu_127_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [5:0] reliability_sequence_64_address0;
reg    reliability_sequence_64_ce0;
wire   [5:0] reliability_sequence_64_q0;
wire   [0:0] icmp_ln106_fu_154_p2;
reg   [0:0] icmp_ln106_reg_270;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln108_fu_173_p2;
reg   [0:0] icmp_ln108_reg_279;
wire   [63:0] zext_ln115_1_fu_160_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln109_fu_185_p1;
wire   [63:0] zext_ln111_1_fu_198_p1;
wire   [63:0] zext_ln115_fu_214_p1;
wire   [63:0] zext_ln111_fu_235_p1;
wire   [7:0] zext_ln112_fu_250_p1;
wire   [31:0] count_2_1_fu_190_p3;
reg   [6:0] j_fu_54;
wire   [6:0] add_ln104_fu_133_p2;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_j_2;
wire   [0:0] trunc_ln260_fu_230_p1;
wire   [5:0] trunc_ln104_fu_139_p1;
wire   [1:0] tmp_fu_144_p4;
wire   [5:0] grp_fu_114_p2;
wire   [2:0] count_1_fu_169_p1;
wire   [31:0] count_2_fu_179_p2;
wire   [7:0] data_1_fu_223_p3;
wire   [6:0] data_2_fu_240_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_109;
reg    ap_condition_261;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

top_polar_encode_Pipeline_VITIS_LOOP_104_2_reliability_sequence_64_ROM_AUTO_1R #(
    .DataWidth( 6 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
reliability_sequence_64_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(reliability_sequence_64_address0),
    .ce0(reliability_sequence_64_ce0),
    .q0(reliability_sequence_64_q0)
);

top_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln104_fu_127_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            j_fu_54 <= add_ln104_fu_133_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_54 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln106_reg_270 <= icmp_ln106_fu_154_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln106_fu_154_p2 == 1'd1) & (icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln108_reg_279 <= icmp_ln108_fu_173_p2;
    end
end

always @ (*) begin
    if (((icmp_ln104_fu_127_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_2 = 7'd0;
    end else begin
        ap_sig_allocacmp_j_2 = j_fu_54;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_109)) begin
        if ((icmp_ln106_reg_270 == 1'd1)) begin
            bit_stream_V_address0 = zext_ln111_fu_235_p1;
        end else if ((icmp_ln106_reg_270 == 1'd0)) begin
            bit_stream_V_address0 = zext_ln115_fu_214_p1;
        end else begin
            bit_stream_V_address0 = 'bx;
        end
    end else begin
        bit_stream_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln106_reg_270 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((icmp_ln106_reg_270 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        bit_stream_V_ce0 = 1'b1;
    end else begin
        bit_stream_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_109)) begin
        if ((icmp_ln106_reg_270 == 1'd1)) begin
            bit_stream_V_d0 = trunc_ln260_fu_230_p1;
        end else if ((icmp_ln106_reg_270 == 1'd0)) begin
            bit_stream_V_d0 = 1'd0;
        end else begin
            bit_stream_V_d0 = 'bx;
        end
    end else begin
        bit_stream_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln106_reg_270 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((icmp_ln106_reg_270 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        bit_stream_V_we0 = 1'b1;
    end else begin
        bit_stream_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln106_fu_154_p2 == 1'd1) & (icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        count_2_1_out_o = count_2_1_fu_190_p3;
    end else begin
        count_2_1_out_o = count_2_1_out_i;
    end
end

always @ (*) begin
    if (((icmp_ln106_fu_154_p2 == 1'd1) & (icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        count_2_1_out_o_ap_vld = 1'b1;
    end else begin
        count_2_1_out_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln106_reg_270 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_1_out_o = zext_ln112_fu_250_p1;
    end else begin
        data_1_out_o = data_1_out_i;
    end
end

always @ (*) begin
    if (((icmp_ln106_reg_270 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_1_out_o_ap_vld = 1'b1;
    end else begin
        data_1_out_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_261)) begin
        if ((icmp_ln106_fu_154_p2 == 1'd1)) begin
            reliability_sequence_64_address0 = zext_ln111_1_fu_198_p1;
        end else if ((icmp_ln106_fu_154_p2 == 1'd0)) begin
            reliability_sequence_64_address0 = zext_ln115_1_fu_160_p1;
        end else begin
            reliability_sequence_64_address0 = 'bx;
        end
    end else begin
        reliability_sequence_64_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln106_fu_154_p2 == 1'd1) & (icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((icmp_ln106_fu_154_p2 == 1'd0) & (icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        reliability_sequence_64_ce0 = 1'b1;
    end else begin
        reliability_sequence_64_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_ce0 = 1'b1;
    end else begin
        src_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln104_fu_133_p2 = (ap_sig_allocacmp_j_2 + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_109 = ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_261 = ((icmp_ln104_fu_127_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign count_1_fu_169_p1 = ap_sig_allocacmp_j_2[2:0];

assign count_2_1_fu_190_p3 = ((icmp_ln108_fu_173_p2[0:0] == 1'b1) ? count_2_fu_179_p2 : count_2_1_out_i);

assign count_2_fu_179_p2 = (count_2_1_out_i + 32'd1);

assign data_1_fu_223_p3 = ((icmp_ln108_reg_279[0:0] == 1'b1) ? src_q0 : data_1_out_i);

assign data_2_fu_240_p4 = {{data_1_fu_223_p3[7:1]}};

assign grp_fu_114_p2 = (trunc_ln104_fu_139_p1 ^ 6'd32);

assign icmp_ln104_fu_127_p2 = ((ap_sig_allocacmp_j_2 == 7'd64) ? 1'b1 : 1'b0);

assign icmp_ln106_fu_154_p2 = ((tmp_fu_144_p4 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln108_fu_173_p2 = ((count_1_fu_169_p1 == 3'd0) ? 1'b1 : 1'b0);

assign src_address0 = zext_ln109_fu_185_p1;

assign tmp_fu_144_p4 = {{ap_sig_allocacmp_j_2[6:5]}};

assign trunc_ln104_fu_139_p1 = ap_sig_allocacmp_j_2[5:0];

assign trunc_ln260_fu_230_p1 = data_1_fu_223_p3[0:0];

assign zext_ln109_fu_185_p1 = count_2_1_out_i;

assign zext_ln111_1_fu_198_p1 = grp_fu_114_p2;

assign zext_ln111_fu_235_p1 = reliability_sequence_64_q0;

assign zext_ln112_fu_250_p1 = data_2_fu_240_p4;

assign zext_ln115_1_fu_160_p1 = grp_fu_114_p2;

assign zext_ln115_fu_214_p1 = reliability_sequence_64_q0;

endmodule //top_polar_encode_Pipeline_VITIS_LOOP_104_2
