/*!A cross-platform build utility based on Lua
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Copyright (C) 2015 - 2019, TBOOX Open Source Group.
 *
 * @author      ruki
 * @file        poller_remove.c
 *
 */

/* //////////////////////////////////////////////////////////////////////////////////////
 * trace
 */
#define TB_TRACE_MODULE_NAME    "poller_remove"
#define TB_TRACE_MODULE_DEBUG   (0)

/* //////////////////////////////////////////////////////////////////////////////////////
 * includes
 */
#include "prefix.h"
#include "poller.h"

/* //////////////////////////////////////////////////////////////////////////////////////
 * interfaces
 */

// io.poller_remove(sock)
tb_int_t xm_io_poller_remove(lua_State* lua)
{
    // check
    tb_assert_and_check_return_val(lua, 0);

    // is user data?
    if (!lua_isuserdata(lua, 1)) 
        return 0;

    // get socket
    tb_socket_ref_t sock = (tb_socket_ref_t)lua_touserdata(lua, 1);
    tb_check_return_val(sock, 0);

    // remove events from poller
    lua_pushboolean(lua, tb_poller_remove(xm_io_poller(), sock));
    return 1;
}

