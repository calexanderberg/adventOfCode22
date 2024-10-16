// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTestBench.h for the primary calling header

#include "VTestBench__pch.h"
#include "VTestBench__Syms.h"
#include "VTestBench___024root.h"

VL_INLINE_OPT VlCoroutine VTestBench___024root___eval_initial__TOP__Vtiming__0(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ TestBench__DOT__unnamedblk1__DOT__i;
    TestBench__DOT__unnamedblk1__DOT__i = 0;
    // Body
    TestBench__DOT__unnamedblk1__DOT__i = 0U;
    while (VL_LTS_III(32, TestBench__DOT__unnamedblk1__DOT__i, 
                      VlQueue<std::string>::consVC(
                                                   std::string{"day1.txt"}, 
                                                   VlQueue<std::string>{}).size())) {
        vlSelfRef.TestBench__DOT__file = VlQueue<std::string>::consVC(
                                                                      std::string{"day1.txt"}, 
                                                                      VlQueue<std::string>{}).at(TestBench__DOT__unnamedblk1__DOT__i);
        co_await vlSelfRef.__VtrigSched_h2e4518e8__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge TestBench.clk)", 
                                                             "TestBench.sv", 
                                                             38);
        if (VL_UNLIKELY((0U == TestBench__DOT__unnamedblk1__DOT__i))) {
            if (vlSymsp->_vm_contextp__->assertOnGet(2, 1)) {
                if (VL_UNLIKELY((vlSelfRef.TestBench__DOT__out11 
                                 != VlQueue<QData/*63:0*/>::consVC(0x10cc2ULL, 
                                                                   VlQueue<QData/*63:0*/>{}).at(TestBench__DOT__unnamedblk1__DOT__i)))) {
                    VL_WRITEF_NX("[%0t] %%Error: TestBench.sv:40: Assertion failed in %NTestBench.unnamedblk1: 'assert' failed.\n",0,
                                 64,VL_TIME_UNITED_Q(1),
                                 -12,vlSymsp->name());
                    VL_STOP_MT("TestBench.sv", 40, "");
                }
            }
            if (vlSymsp->_vm_contextp__->assertOnGet(2, 1)) {
                if (VL_UNLIKELY((vlSelfRef.TestBench__DOT__out12 
                                 != VlQueue<QData/*63:0*/>::consVC(0x3223aULL, 
                                                                   VlQueue<QData/*63:0*/>{}).at(TestBench__DOT__unnamedblk1__DOT__i)))) {
                    VL_WRITEF_NX("[%0t] %%Error: TestBench.sv:41: Assertion failed in %NTestBench.unnamedblk1: 'assert' failed.\n",0,
                                 64,VL_TIME_UNITED_Q(1),
                                 -12,vlSymsp->name());
                    VL_STOP_MT("TestBench.sv", 41, "");
                }
            }
            VL_WRITEF_NX("Day%11d, part1: %20#\nDay%11d, part2: %20#\n",0,
                         32,((IData)(1U) + TestBench__DOT__unnamedblk1__DOT__i),
                         64,vlSelfRef.TestBench__DOT__out11,
                         32,((IData)(1U) + TestBench__DOT__unnamedblk1__DOT__i),
                         64,vlSelfRef.TestBench__DOT__out12);
        }
        TestBench__DOT__unnamedblk1__DOT__i = ((IData)(1U) 
                                               + TestBench__DOT__unnamedblk1__DOT__i);
    }
    VL_FINISH_MT("TestBench.sv", 52, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTestBench___024root___dump_triggers__act(VTestBench___024root* vlSelf);
#endif  // VL_DEBUG

void VTestBench___024root___eval_triggers__act(VTestBench___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTestBench__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTestBench___024root___eval_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, ((IData)(vlSelfRef.TestBench__DOT__clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__TestBench__DOT__clk__0))));
    vlSelfRef.__VactTriggered.set(1U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__TestBench__DOT__clk__0 
        = vlSelfRef.TestBench__DOT__clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VTestBench___024root___dump_triggers__act(vlSelf);
    }
#endif
}
