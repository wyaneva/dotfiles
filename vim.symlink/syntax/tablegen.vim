" Vim syntax file
" Language:   TableGen
" Maintainer: The LLVM team, http://llvm.org/
" Version:    $Revision$

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" May be changed if you have a really slow machine
syntax sync minlines=100

syn case match

syn keyword tgKeyword   def let in code dag field include defm
syn keyword tgType      class int string list bit bits multiclass

syn match   tgNumber    /\<\d\+\>/
syn match   tgNumber    /\<\d\+\.\d*\>/
syn match   tgNumber    /\<0b[01]\+\>/
syn match   tgNumber    /\<0x[0-9a-fA-F]\+\>/
syn region  tgString    start=/"/ skip=/\\"/ end=/"/    oneline

syn region  tgCode      start=/\[{/ end=/}\]/

syn keyword tgTodo             contained TODO FIXME
syn match   tgComment   /\/\/.*$/         contains=tgTodo
" Handle correctly imbricated comment
syn region  tgComment2 matchgroup=tgComment2  start=+/\*+ end=+\*/+ contains=tgTodo,tgComment2

" Value Types
syn keyword tgValType contained OtherVT iPTR iPTRAny vAny fAny iAny
syn keyword tgValType contained i1 i8 i16 i32 i64 i128 f16 f32 f64 f80 f128 ppcf128
syn keyword tgValType contained v2i1 v4i1 v8i1 v16i1 v32i1 v64i1 v2i8 v4i8 v8i8 v16i8
syn keyword tgValType contained v32i8 v64i8 v1i16 v2i16 v4i16 v8i16 v16i16 v32i16 v1i32
syn keyword tgValType contained v2i32 v4i32 v8i32 v16i32 v1i64 v2i64 v4i64 v8i64 v16i64
syn keyword tgValType contained v2f16 v2f32 v4f32 v8f32 v16f32 v2f64 v4f64 v8f64
syn keyword tgValType contained x86mmx FlagVT isVoid untyped MetadataVT

" Operand Types
syn keyword tgOpType contained i1imm i8imm i16imm i32imm i64imm f32imm f64imm

" Pattern Nodes
syn keyword tgPatNode contained set implicit node srcvalue

" Pattern Types
syn keyword tgPatType contained imm timm fpimm vt bb cond undef
syn keyword tgPatType contained globaladdr tglobaladdr tglobaltlsaddr
syn keyword tgPatType contained constpool tconstpool jumptable tjumptable
syn keyword tgPatType contained frameindex tframeindex externalsym texternalsym
syn keyword tgPatType contained blockaddress tblockaddress

" Pattern Keywords
syn keyword tgPatKeyword contained add sub mul mulhs mulhu smullohi umullohi
syn keyword tgPatKeyword contained sdiv udiv srem urem sdivrem udivrem srl sra
syn keyword tgPatKeyword contained shl rotl rotr and or xor addc adde subc sube
syn keyword tgPatKeyword contained sext_inreg bswap
syn keyword tgPatKeyword contained ctlz cttz ctpop ctlz_zero_undef cttz_zero_undef
syn keyword tgPatKeyword contained sext zext anyext trunc bitconvert
syn keyword tgPatKeyword contained extractelt insertelt
syn keyword tgPatKeyword contained fadd fsub fmul fdiv frem fma fabs fgetsign fneg
syn keyword tgPatKeyword contained fsqrt fsin fcos fexp2 flog2 frint ftrunc fceil
syn keyword tgPatKeyword contained ffloor fnearbyint fround fextend fcopysign
syn keyword tgPatKeyword contained sint_to_fp uint_to_fp fp_to_sint fp_to_uint
syn keyword tgPatKeyword contained f16_to_f32 f32_to_f16
syn keyword tgPatKeyword contained setcc select vselect selectcc
syn keyword tgPatKeyword contained brcond brind br
syn keyword tgPatKeyword contained trap debugtrap prefetch readcyclecounter
syn keyword tgPatKeyword contained atomic_fence     atomic_cmp_swap atomic_load_add
syn keyword tgPatKeyword contained atomic_swap      atomic_load_sub stomic_load_add
syn keyword tgPatKeyword contained atomic_load_or   atomic_load_xor atomic_load_nand
syn keyword tgPatKeyword contained atomic_load_min  atomic_load_max atomic_load_umin
syn keyword tgPatKeyword contained atomic_load_umax atomic_load     atomic_store

syn keyword tgPatKeyword contained ld st ist
syn keyword tgPatKeyword contained vector_shuffle build_vector scalar_to_vector
syn keyword tgPatKeyword contained vector_extract vector_insert vector_extract_subvec
syn keyword tgPatKeyword contained extract_subvector insert_subvector

syn keyword tgPatKeyword contained intrinsic_void intrinsic_w_chain intrinsic_wo_chain
syn keyword tgPatKeyword contained cvt

" Pattern Fragment Keywords
syn keyword tgPatKeyword contained vtInt vtFP immAllOnesV immAllZerosV
syn keyword tgPatKeyword contained not vnot ineg

syn keyword tgPatKeyword contained unindexedload load extload sextload zextload
syn keyword tgPatKeyword contained extloadi1 extloadi8 extloadi16 extloadi32 extloadf32 extloadf64
syn keyword tgPatKeyword contained sextloadi1 sextloadi8 sextloadi16 sextloadi32
syn keyword tgPatKeyword contained zextloadi1 zextloadi8 zextloadi16 zextloadi32
syn keyword tgPatKeyword contained extloadvi1 extloadvi8 extloadvi16 extloadvi32 extloadvf32 extloadvf64
syn keyword tgPatKeyword contained sextloadvi1 sextloadvi8 sextloadvi16 sextloadvi32
syn keyword tgPatKeyword contained zextloadvi1 zextloadvi8 zextloadvi16 zextloadvi32

syn keyword tgPatKeyword contained unindexedstore store truncstore
syn keyword tgPatKeyword contained truncstorei8 truncstorei16 truncstorei32 truncstoref32 truncstoref64
syn keyword tgPatKeyword contained istore pre_store itruncstore pre_truncst
syn keyword tgPatKeyword contained pre_truncsti1 pre_truncsti8 pre_truncsti16 pre_truncsti32 pre_truncstf32
syn keyword tgPatKeyword contained post_store post_truncst
syn keyword tgPatKeyword contained post_truncsti1 post_truncsti8 post_truncsti16 post_truncsti32 post_truncstf32

syn keyword tgPatKeyword contained setoeq setogt setoge setolt setone seto setuo setueq setugt setuge
syn keyword tgPatKeyword contained setult setule setune seteq setgt setge setlt setle setne

syn keyword tgPatKeyword contained atomic_cmp_swap_8 atomic_cmp_swap_16 atomic_cmp_swap_32 atomic_cmp_swap_64

syn keyword tgPatKeyword contained atomic_load_add_8 atomic_load_add_16 atomic_load_add_32 atomic_load_add_64
syn keyword tgPatKeyword contained atomic_swap_8 atomic_swap_16 atomic_swap_32 atomic_swap_64
syn keyword tgPatKeyword contained atomic_load_sub_8 atomic_load_sub_16 atomic_load_sub_32 atomic_load_sub_64
syn keyword tgPatKeyword contained stomic_load_add_8 stomic_load_add_16 stomic_load_add_32 stomic_load_add_64
syn keyword tgPatKeyword contained atomic_load_or_8 atomic_load_or_16 atomic_load_or_32 atomic_load_or_64
syn keyword tgPatKeyword contained atomic_load_xor_8 atomic_load_xor_16 atomic_load_xor_32 atomic_load_xor_64
syn keyword tgPatKeyword contained atomic_load_nand_8 atomic_load_nand_16 atomic_load_nand_32 atomic_load_nand_64
syn keyword tgPatKeyword contained atomic_load_min_8 atomic_load_min_16 atomic_load_min_32 atomic_load_min_64
syn keyword tgPatKeyword contained atomic_load_max_8 atomic_load_max_16 atomic_load_max_32 atomic_load_max_64
syn keyword tgPatKeyword contained atomic_load_umin_8 atomic_load_umin_16 atomic_load_umin_32 atomic_load_umin_64
syn keyword tgPatKeyword contained atomic_load_umax_8 atomic_load_umax_16 atomic_load_umax_32 atomic_load_umax_64
syn keyword tgPatKeyword contained atomic_store_8 atomic_store_16 atomic_store_32 atomic_store_64
syn keyword tgPatKeyword contained atomic_load_8 atomic_load_16 atomic_load_32 atomic_load_64

syn keyword tgPatKeyword contained cvtff cvtss cvtsu cvtus cvtuu cvtsf cvtuf cvtfs cvtfu

syn region  tgList   start=/(/ end=/)/ contains=tgOpType,tgValType,tgPatType,tgString
syn region  tgPatList   start=/(/ end=/)/ contained contains=tgPatKeyword,tgPatNode,tgPatType,tgValType,tgString
syn region  tgPat   start=/Pat\(Leaf\)_s*</ end=/\>/ contains=tgPatKeyword,tgPatNode,tgPatType,tgString
syn region  tgPattern   start=/\[/ end=/\]/ contains=tgList,tgPatList,tgString

if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tgKeyword Statement
  HiLink tgType Type
  HiLink tgNumber Number
  HiLink tgComment Comment
  HiLink tgComment2 Comment
  HiLink tgString String
  " May find a better Hilight group...
  HiLink tgCode Special
  HiLink tgTodo Todo

  HiLink tgOpType  Type
  HiLink tgValType Type
  HiLink tgPatType Type

  HiLink tgPatNode Statement
  HiLink tgPatKeyword Special

  delcommand HiLink
endif

let b:current_syntax = "tablegen"
