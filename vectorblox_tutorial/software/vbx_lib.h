//VBXCOPYRIGHTTAG
/**
 * @file
 * @defgroup VBX_lib VBX library
 * @brief VBX library
 *
 * @ingroup VBXapi
 */
/**@{*/

#ifndef __VBX_LIB_H
#define __VBX_LIB_H

#ifdef __cplusplus
extern "C" {
#endif

static inline void vbx_sync();

/** Set the 1D length of vector to operate on.
 *  NOTE: don't call this directly, call through vbx_set_vl macro.
 * @param[in] LENGTH -- number of units to operate on
 */
static inline void vbx_set_vl( int  LENGTH );

/** Gets the value of length of vector to operate on, saves value to LENGTH.
 *
 * @param[out] LENGTH
 */
static inline void vbx_get_vl( int *LENGTH );

/** Gets the mask status, saves the value to MASK_STATUS.
 *
 * @param[out] MASK_STATUS
 */
static inline void vbx_get_mask_status( int *MASK_STATUS );

/** Sets the value stored at REGADDR to VALUE.
 *
 * @param[in] REGADDR
 * @param[in] VALUE
 */
static inline void vbx_set_reg( int REGADDR, int  VALUE );

/** Gets the value at REGADDR, saves the value to VALUE.
 *
 * @param[in] REGADDR
 * @param[out] VALUE
 */
static inline void vbx_get_reg( int REGADDR, int *VALUE );

/** Set the 2D vector to operate on.
 * Increments applied after every row of 1D vector operation
 * 1D operation of length set @ref vbx_set_vl, repeated @a ROWS times
 * NOTE: don't call this directly, call through vbx_set_2D macro
 *
 * @param[in] ROWS -- number of rows to repeat 1D vector op
 * @param[in] ID -- 2D increment of DEST
 * @param[in] IA -- 2D increment of SRCA
 * @param[in] IB -- 2D increment of SRCB
 */
static inline void vbx_set_2D( int  ROWS, int  ID,   int  IA,   int  IB   );
/** Set the 3D vector to operate on.
 * 3D increments applied after every row of 2D vector operation
 * 1D operation of length set @ref vbx_set_vl, repeated @a ROWS times
 * 2D operation of length set @ref vbx_set_2D, repeated @a MATS times
 * NOTE: don't call this directly, call through vbx_set_3D macro
 *
 * @param[in] MATS -- number of times to repeat 2D vector op
 * @param[in] ID3D -- 3D increment of DEST
 * @param[in] IA3D -- 3D increment of SRCA
 * @param[in] IB3D -- 3D increment of SRCB
 */
static inline void vbx_set_3D( int  MATS, int  ID3D, int  IA3D, int  IB3D );

/** Get the 2D vector parameters.
 *
 * @param[out] ROWS -- number of rows to repeat 1D vector op
 * @param[out] ID -- 2D increment of DEST
 * @param[out] IA -- 2D increment of SRCA
 * @param[out] IB -- 2D increment of SRCB
 */
static inline void vbx_get_2D( int *ROWS, int *ID,   int *IA,   int *IB   );

/** Get the 3D vector parameters.
 *
 * @param[out] MATS -- number of times to repeat 2D vector op
 * @param[out] ID3D -- 3D increment of DEST
 * @param[out] IA3D -- 3D increment of SRCA
 * @param[out] IB3D -- 3D increment of SRCB
 */
static inline void vbx_get_3D( int *MATS, int *ID3D, int *IA3D, int *IB3D );

/** Use DMA engine to transfer values in scratchpad to host
 * Use vbx_dma_to_host() macro wrapper to call it, and then
 * the runtime checks compiler defines will determine whether
 * the checks are done.
 *
 * @param[out] EXT -- host destination address
 * @param[in] INT -- scratchpad sourc address
 * @param[in] LENGTH -- number of **bytes** to transfer
 */
static inline void vbx_dma_to_host(void *EXT, vbx_void_t *INT, int LENGTH );

/** Use DMA engine to transfer values from host to scratchpad
 * Use vbx_dma_to_host() macro wrapper to call it, and then
 * the runtime checks compiler defines will determine whether
 * the checks are done.
 *
 * @param[out] INT -- host destination address
 * @param[in] EXT -- scratchpad sourc address
 * @param[in] LENGTH -- number of **bytes** to transfer
 */
static inline void vbx_dma_to_vector(vbx_void_t *INT, void *EXT, int LENGTH );

/** 2D DMA transfer from scratchpad to host
 *
 * @param[out] dst -- destination address in external memory
 * @param[in] v_src -- source address in scratchpad memory
 * @param[in] xlen -- number of bytes to transfer
 * @param[in] ylen -- number of rows to transfer
 * @param[in] dst_stride -- stride of dst in bytes
 * @param[in] src_stride  -- stride of src in bytes
 */
static inline void vbx_dma_to_host_2D  ( void *dst, vbx_void_t *v_src, int32_t xlen, int32_t ylen, int32_t dst_stride, int32_t src_stride );

/** 2D DMA transfer from host to scratchpad
 *
 * @param[out] v_dst -- destination address in scratchpad memory
 * @param[in] src -- source address in external memory
 * @param[in] xlen -- number of bytes to transfer
 * @param[in] ylen -- number of rows to transfer
 * @param[in] dst_stride -- stride of dst in bytes
 * @param[in] src_stride  -- stride of src in bytes
 */
static inline void vbx_dma_to_vector_2D( vbx_void_t *v_dst, void *src, int32_t xlen, int32_t ylen, int32_t dst_stride, int32_t src_stride );

/**
 * Constants
 */
#define MAX_MXP_REG 32
// 1D
#define GET_VL          0
// 2D
#define GET_ROWS        1
#define GET_ID          2
#define GET_IA          3
#define GET_IB          4
// 2D aliases
#define GET_ID2D        2
#define GET_IA2D        3
#define GET_IB2D        4
// 3D
#define GET_MATS        5
#define GET_ID3D        6
#define GET_IA3D        7
#define GET_IB3D        8

#ifdef VBX_DMA2D
#undef VBX_DMA2D
#endif
#define VBX_DMA2D 1
#include "vbx_asm_or_sim.h"
#if VBX_ASSEMBLER
#include "vbx_lib_asm.h"
#endif // VBX_ASSEMBLER

#if VBX_SIMULATOR
#include "vbx_lib_sim.h"
#endif //SIMULATOR

#include "vbx_lib_common.h"
#ifdef __cplusplus
}
#endif

#endif // __VBX_LIB_H
/**@}*/
