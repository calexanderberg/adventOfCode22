// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VTestBench.h for the primary calling header

#ifndef VERILATED_VTESTBENCH___024ROOT_H_
#define VERILATED_VTESTBENCH___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VTestBench__Syms;

class alignas(VL_CACHE_LINE_BYTES) VTestBench___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ TestBench__DOT__clk;
    CData/*0:0*/ __VdlyVal__TestBench__DOT__clk__v0;
    CData/*0:0*/ __VdlySet__TestBench__DOT__clk__v0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__TestBench__DOT__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    QData/*63:0*/ TestBench__DOT__out11;
    QData/*63:0*/ TestBench__DOT__out12;
    QData/*63:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__sum;
    QData/*63:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp1;
    QData/*63:0*/ TestBench__DOT__day1__DOT__unnamedblk1__DOT__temp2;
    VlQueue<QData/*63:0*/> TestBench__DOT__day1__DOT__unnamedblk1__DOT__data;
    std::string TestBench__DOT__file;
    std::string TestBench__DOT__day1__DOT__unnamedblk1__DOT__unnamedblk2__DOT__line;
    VlTriggerScheduler __VtrigSched_h2e4518e8__0;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    VTestBench__Syms* const vlSymsp;

    // CONSTRUCTORS
    VTestBench___024root(VTestBench__Syms* symsp, const char* v__name);
    ~VTestBench___024root();
    VL_UNCOPYABLE(VTestBench___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
