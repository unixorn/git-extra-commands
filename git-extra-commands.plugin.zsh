# Copyright 2006-2026 Joseph Block <jpb@apesseekingknowledge.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Add our plugin's bin diretory to user's path per
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling

0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

local git_extra_commands_bin="${0:h}/bin"
local git_extra_commands_completions="${0:h}/completions"

if [[ -z "${path[(r)${git_extra_commands_bin}]}" ]]; then
    path+=( "${git_extra_commands_bin}" )
fi

if [[ -z "${fpath[(r)${git_extra_commands_completions}]}" ]]; then
    fpath=( "${git_extra_commands_completions}" ${fpath} )
fi

alias git-grab='git-incoming-commits'
alias gitroot='cd $(git rev-parse --show-toplevel) && echo "$_"'
alias git-cdroot='cd $(git rev-parse --show-toplevel) && echo "$_"'
