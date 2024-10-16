// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VTESTBENCH__SYMS_H_
#define VERILATED_VTESTBENCH__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VTestBench.h"

// INCLUDE MODULE CLASSES
#include "VTestBench___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)VTestBench__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VTestBench* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VTestBench___024root           TOP;

    // SCOPE NAMES
    VerilatedScope __Vscope_TestBench;
    VerilatedScope __Vscope_TestBench__unnamedblk1;

    // CONSTRUCTORS
    VTestBench__Syms(VerilatedContext* contextp, const char* namep, VTestBench* modelp);
    ~VTestBench__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
