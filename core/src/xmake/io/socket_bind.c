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
 * @file        socket_bind.c
 *
 */

/* //////////////////////////////////////////////////////////////////////////////////////
 * trace
 */
#define TB_TRACE_MODULE_NAME    "socket_bind"
#define TB_TRACE_MODULE_DEBUG   (0)

/* //////////////////////////////////////////////////////////////////////////////////////
 * includes
 */
#include "prefix.h"

/* //////////////////////////////////////////////////////////////////////////////////////
 * interfaces
 */

// io.socket_bind(sock, addr, port, family)
tb_int_t xm_io_socket_bind(lua_State* lua)
{
    // check
    tb_assert_and_check_return_val(lua, 0);

    // check socket
    if (!lua_isuserdata(lua, 1)) 
    {
        lua_pushboolean(lua, tb_false);
        lua_pushliteral(lua, "invalid socket!");
        return 2;
    }

    // get socket
    tb_socket_ref_t sock = (tb_socket_ref_t)lua_touserdata(lua, 1);
    tb_check_return_val(sock, 0);

    // get address
    tb_char_t const* address = lua_tostring(lua, 2);
    tb_assert_and_check_return_val(address, 0);

    // get port
    tb_uint16_t port = (tb_uint16_t)luaL_checknumber(lua, 3);

    // get family
    tb_uint8_t family = (tb_uint8_t)luaL_checknumber(lua, 4);

    // init address
    tb_ipaddr_t addr;
    tb_ipaddr_set(&addr, address, port, family);

    // bind socket
    lua_pushboolean(lua, tb_socket_bind(sock, &addr));
    return 1;
}

