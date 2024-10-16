// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VTestBench__pch.h"

//============================================================
// Constructors

VTestBench::VTestBench(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VTestBench__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VTestBench::VTestBench(const char* _vcname__)
    : VTestBench(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VTestBench::~VTestBench() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VTestBench___024root___eval_debug_assertions(VTestBench___024root* vlSelf);
#endif  // VL_DEBUG
void VTestBench___024root___eval_static(VTestBench___024root* vlSelf);
void VTestBench___024root___eval_initial(VTestBench___024root* vlSelf);
void VTestBench___024root___eval_settle(VTestBench___024root* vlSelf);
void VTestBench___024root___eval(VTestBench___024root* vlSelf);

void VTestBench::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VTestBench::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VTestBench___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VTestBench___024root___eval_static(&(vlSymsp->TOP));
        VTestBench___024root___eval_initial(&(vlSymsp->TOP));
        VTestBench___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VTestBench___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VTestBench::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t VTestBench::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* VTestBench::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VTestBench___024root___eval_final(VTestBench___024root* vlSelf);

VL_ATTR_COLD void VTestBench::final() {
    VTestBench___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VTestBench::hierName() const { return vlSymsp->name(); }
const char* VTestBench::modelName() const { return "VTestBench"; }
unsigned VTestBench::threads() const { return 1; }
void VTestBench::prepareClone() const { contextp()->prepareClone(); }
void VTestBench::atClone() const {
    contextp()->threadPoolpOnClone();
}
