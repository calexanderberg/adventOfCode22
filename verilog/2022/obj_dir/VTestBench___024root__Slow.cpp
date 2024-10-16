// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTestBench.h for the primary calling header

#include "VTestBench__pch.h"
#include "VTestBench__Syms.h"
#include "VTestBench___024root.h"

void VTestBench___024root___ctor_var_reset(VTestBench___024root* vlSelf);

VTestBench___024root::VTestBench___024root(VTestBench__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VTestBench___024root___ctor_var_reset(this);
}

void VTestBench___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VTestBench___024root::~VTestBench___024root() {
}
