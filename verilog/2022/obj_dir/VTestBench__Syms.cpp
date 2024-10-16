// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "VTestBench__pch.h"
#include "VTestBench.h"
#include "VTestBench___024root.h"

// FUNCTIONS
VTestBench__Syms::~VTestBench__Syms()
{
}

VTestBench__Syms::VTestBench__Syms(VerilatedContext* contextp, const char* namep, VTestBench* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
        // Check resources
        Verilated::stackCheck(55);
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    // Setup scopes
    __Vscope_TestBench.configure(this, name(), "TestBench", "TestBench", -12, VerilatedScope::SCOPE_OTHER);
    __Vscope_TestBench__unnamedblk1.configure(this, name(), "TestBench.unnamedblk1", "unnamedblk1", -12, VerilatedScope::SCOPE_OTHER);
}
