// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTestBench.h for the primary calling header

#include "VTestBench__pch.h"
#include "VTestBench___024root.h"

VL_ATTR_COLD void VTestBench___024root___eval_static(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_static\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VTestBench___024root___eval_final(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_final\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VTestBench___024root___eval_settle(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_settle\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTestBench___024root___dump_triggers__act(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___dump_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge TestBench.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VTestBench___024root___dump_triggers__nba(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___dump_triggers__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge TestBench.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VTestBench___024root___ctor_var_reset(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___ctor_var_reset\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->TestBench__DOT__out11 = VL_RAND_RESET_Q(64);
    vlSelf->TestBench__DOT__out12 = VL_RAND_RESET_Q(64);
    vlSelf->TestBench__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->TestBench__DOT__day1__DOT__unnamedblk1__DOT__data.atDefault() = VL_RAND_RESET_Q(64);
    vlSelf->TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum = VL_RAND_RESET_Q(64);
    vlSelf->TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1 = VL_RAND_RESET_Q(64);
    vlSelf->TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2 = VL_RAND_RESET_Q(64);
    vlSelf->__VdlyVal__TestBench__DOT__clk__v0 = VL_RAND_RESET_I(1);
    vlSelf->__VdlySet__TestBench__DOT__clk__v0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__TestBench__DOT__clk__0 = VL_RAND_RESET_I(1);
}
