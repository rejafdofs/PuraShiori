/* PuraShiori/c/sstpDirectum.c
 * ディレクトゥム SSTP — WM_COPYDATA 経由で SSP にスクリプトゥムを送信するにゃん
 * Lean 附属 clang は標準ヘッダを持たないので lean/lean.h のみ使ふにゃん */

#include <lean/lean.h>

/* Windows 型の手動宣言にゃん（64 ビット Windows 固定にゃ） */
typedef void*              HWND;
typedef void*              PVOID;
typedef unsigned int       DWORD;       /* 32 ビット無符号整數にゃん */
typedef unsigned long long WPARAM;      /* 64 ビット無符号ポインタ幅にゃん */
typedef long long          LPARAM;      /* 64 ビット有符号ポインタ幅にゃん */
typedef long long          LRESULT;

typedef struct {
    DWORD dwData;
    DWORD cbData;
    PVOID lpData;
} COPYDATASTRUCT;

#define WM_COPYDATA 0x004A

/* Win32 API 宣言にゃん */
extern HWND    __stdcall FindWindowExA(HWND, HWND, const char*, const char*);
extern LRESULT __stdcall SendMessageA(HWND, unsigned int, WPARAM, LPARAM);

/* lean_string_byte_size はヌル終端文字を含むので自前で長さを數へるにゃん */
static DWORD str_len(const char* s) {
    DWORD n = 0;
    while (s[n]) n++;
    return n;
}

/* ディレクトゥム SSTP — dwData = 9801，lpData = SSTP/1.4 リクウェスティオ（UTF-8）にゃん */
static void sstp_directum_mittere_raw(const char* data, DWORD size) {
    HWND hwnd = FindWindowExA((HWND)0, (HWND)0, "SSP", (const char*)0);
    if (hwnd == (HWND)0) return;
    COPYDATASTRUCT cds;
    cds.dwData = 9801;
    cds.cbData = size;
    cds.lpData = (PVOID)data;
    SendMessageA(hwnd, WM_COPYDATA, (WPARAM)0, (LPARAM)&cds);
}

/* Lean FFI エントリーポイントゥム — 文字列を受け取つて送信するにゃん */
LEAN_EXPORT lean_obj_res sstp_directum_mittere(lean_obj_arg request, lean_obj_arg world) {
    const char* str = lean_string_cstr(request);
    sstp_directum_mittere_raw(str, str_len(str));
    return lean_io_result_mk_ok(lean_box(0));
}
