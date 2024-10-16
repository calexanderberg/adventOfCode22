// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTestBench.h for the primary calling header

#include "VTestBench__pch.h"
#include "VTestBench___024root.h"

VlCoroutine VTestBench___024root___eval_initial__TOP__Vtiming__0(VTestBench___024root* vlSelf);
VlCoroutine VTestBench___024root___eval_initial__TOP__Vtiming__1(VTestBench___024root* vlSelf);

void VTestBench___024root___eval_initial(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_initial\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VTestBench___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    VTestBench___024root___eval_initial__TOP__Vtiming__1(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__TestBench__DOT__clk__0 
        = vlSelfRef.TestBench__DOT__clk;
}

VL_INLINE_OPT VlCoroutine VTestBench___024root___eval_initial__TOP__Vtiming__1(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_initial__TOP__Vtiming__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (1U) {
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "TestBench.sv", 
                                             55);
        vlSelfRef.__VdlyVal__TestBench__DOT__clk__v0 
            = (1U & (~ (IData)(vlSelfRef.TestBench__DOT__clk)));
        vlSelfRef.__VdlySet__TestBench__DOT__clk__v0 = 1U;
    }
}

void VTestBench___024root___eval_act(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

void VTestBench___024root___nba_sequent__TOP__0(VTestBench___024root* vlSelf);
void VTestBench___024root___nba_sequent__TOP__1(VTestBench___024root* vlSelf);

void VTestBench___024root___eval_nba(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VTestBench___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VTestBench___024root___nba_sequent__TOP__1(vlSelf);
    }
}

VL_INLINE_OPT void VTestBench___024root___nba_sequent__TOP__0(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___nba_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.__VdlySet__TestBench__DOT__clk__v0) {
        vlSelfRef.__VdlySet__TestBench__DOT__clk__v0 = 0U;
        vlSelfRef.TestBench__DOT__clk = vlSelfRef.__VdlyVal__TestBench__DOT__clk__v0;
    }
}

VL_INLINE_OPT void VTestBench___024root___nba_sequent__TOP__1(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___nba_sequent__TOP__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__index;
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__index = 0;
    QData/*63:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3;
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3 = 0;
    IData/*31:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__file;
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__file = 0;
    IData/*31:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i;
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i = 0;
    // Body
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__index = 0U;
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3 = 0ULL;
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__file 
        = VL_FOPEN_NN(VL_CVT_PACK_STR_NN(VL_CONCATN_NNN(
                                                        std::string{"../inputs/"}, vlSelfRef.TestBench__DOT__file))
                      , std::string{"r"});
    ;
    if ((0U == TestBench__DOT__day1__DOT__unnamedblk1__DOT__file)) {
        VL_WRITEF_NX("error: unable to open file ../tests/%@\n",0,
                     -1,&(vlSelfRef.TestBench__DOT__file));
    } else {
        while ((! (TestBench__DOT__day1__DOT__unnamedblk1__DOT__file ? feof(VL_CVT_I_FP(TestBench__DOT__day1__DOT__unnamedblk1__DOT__file)) : true))) {
            (void)VL_FGETS_NI(vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk2__DOT__line, TestBench__DOT__day1__DOT__unnamedblk1__DOT__file);
            vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__data.renew_copy(
                                                                                ((IData)(1U) 
                                                                                + TestBench__DOT__day1__DOT__unnamedblk1__DOT__index), vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__data);
            (void)VL_SSCANF_INNX(64,vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk2__DOT__line,"%#",0,
                                 64,&(vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__data.at(TestBench__DOT__day1__DOT__unnamedblk1__DOT__index))) ;
            TestBench__DOT__day1__DOT__unnamedblk1__DOT__index 
                = ((IData)(1U) + TestBench__DOT__day1__DOT__unnamedblk1__DOT__index);
        }
        VL_FCLOSE_I(TestBench__DOT__day1__DOT__unnamedblk1__DOT__file); }
    TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i = 0U;
    while (VL_LTS_III(32, TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i, vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__data.size())) {
        if (((0ULL == vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__data.at(TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i)) 
             & (0ULL != vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum))) {
            if ((vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                 > vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1)) {
                TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3 
                    = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2;
                vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2 
                    = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1;
                vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1 
                    = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum;
            } else if (((vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                         > vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2) 
                        & (vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                           != vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1))) {
                TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3 
                    = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2;
                vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2 
                    = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum;
            } else if ((((vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                          > TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3) 
                         & (vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                            != vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1)) 
                        & (vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                           != vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2))) {
                TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3 
                    = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum;
            }
            vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum = 0ULL;
        } else {
            vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                = (vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum 
                   + vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__data.at(TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i));
        }
        TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i 
            = ((IData)(1U) + TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk3__DOT__i);
    }
    vlSelfRef.TestBench__DOT__out11 = vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1;
    vlSelfRef.TestBench__DOT__out12 = ((vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1 
                                        + vlSelfRef.TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2) 
                                       + TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp3);
}

void VTestBench___024root___timing_commit(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___timing_commit\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((! (1ULL & vlSelfRef.__VactTriggered.word(0U)))) {
        vlSelfRef.__VtrigSched_h2e4518e8__0.commit(
                                                   "@(posedge TestBench.clk)");
    }
}

void VTestBench___024root___timing_resume(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___timing_resume\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VtrigSched_h2e4518e8__0.resume(
                                                   "@(posedge TestBench.clk)");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VTestBench___024root___eval_triggers__act(VTestBench___024root* vlSelf);

bool VTestBench___024root___eval_phase__act(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VTestBench___024root___eval_triggers__act(vlSelf);
    VTestBench___024root___timing_commit(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        VTestBench___024root___timing_resume(vlSelf);
        VTestBench___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VTestBench___024root___eval_phase__nba(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_phase__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        VTestBench___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTestBench___024root___dump_triggers__nba(VTestBench___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VTestBench___024root___dump_triggers__act(VTestBench___024root* vlSelf);
#endif  // VL_DEBUG

void VTestBench___024root___eval(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            VTestBench___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("TestBench.sv", 7, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                VTestBench___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("TestBench.sv", 7, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (VTestBench___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (VTestBench___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VTestBench___024root___eval_debug_assertions(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_debug_assertions\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
