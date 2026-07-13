#!/usr/bin/env bash
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
#
# Bash completion for git-extra-commands
#
# Source this file or place it in /etc/bash_completion.d/ or
# ~/.local/share/bash-completion/completions/

# --- Helper functions ---

__git_extra_branch_names() {
  git branch --format='%(refname:short)' 2>/dev/null
}

__git_extra_remote_branch_names() {
  git branch -r --format='%(refname:short)' 2>/dev/null
}

__git_extra_remote_names() {
  git remote 2>/dev/null
}

__git_extra_tag_names() {
  git tag -l 2>/dev/null
}

__git_extra_tracked_files() {
  git ls-files 2>/dev/null
}

__git_extra_modified_files() {
  git diff --name-only 2>/dev/null
}

__git_extra_conflicted_files() {
  git diff --name-only --diff-filter=U 2>/dev/null
}

__git_extra_refs() {
  { __git_extra_branch_names; __git_extra_tag_names; } 2>/dev/null
}

# Generate COMPREPLY from a wordlist for the current word
__git_extra_complete_words() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "$1" -- "$cur"))
}

# --- Individual command completions ---

_git_add_match() {
  # arg 1: search pattern (free text)
  COMPREPLY=()
}

_git_add_username_remote() {
  # arg 1: github username (free text)
  COMPREPLY=()
}

_git_amend_all() {
  COMPREPLY=()
}

_git_attic() {
  COMPREPLY=()
}

_git_authors() {
  __git_extra_complete_words "$(git ls-files 2>/dev/null)"
}

_git_big_file() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) COMPREPLY=($(compgen -W "$(__git_extra_refs)" -- "$cur")) ;;
    2) COMPREPLY=() ;; # threshold in MB, free text
  esac
}

_git_branch_clean() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_branch_date() {
  COMPREPLY=()
}

_git_branch_diff() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_branch_name() {
  COMPREPLY=()
}

_git_branch_rebaser() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_branch_status() {
  COMPREPLY=()
}

_git_branches() {
  COMPREPLY=()
}

_git_branches_that_touch() {
  COMPREPLY=($(compgen -d -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_brcl() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_bug_clusters() {
  COMPREPLY=()
}

_git_capture_wip() {
  COMPREPLY=()
}

_git_change_author() {
  # args: old-author new-name new-email (all free text)
  COMPREPLY=()
}

_git_changelog() {
  COMPREPLY=()
}

_git_changes() {
  __git_extra_complete_words "$(git ls-files 2>/dev/null)"
}

_git_checkout_branches() {
  COMPREPLY=()
}

_git_checkout_by_date() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -ge 2 ]]; then
    COMPREPLY=($(compgen -W "$(__git_extra_tracked_files)" -- "$cur"))
  fi
}

_git_checkout_commit() {
  COMPREPLY=()
}

_git_checkout_default_branch() {
  COMPREPLY=()
}

_git_checkout_latest_tag() {
  COMPREPLY=()
}

_git_checkout_pr() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "clean" ;;
    2) __git_extra_complete_words "$(__git_extra_remote_names)" ;;
  esac
}

_git_checkout_preview() {
  COMPREPLY=()
}

_git_checkout_tag() {
  __git_extra_complete_words "$(__git_extra_tag_names)"
}

_git_children_of() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_churn() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "--since= --until= --after= --before=" -- "$cur"))
}

_git_clone_subset() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "-h --help"
       COMPREPLY+=($(compgen -d -- "$cur")) ;;
    2) COMPREPLY=($(compgen -d -- "$cur")) ;;
    3) COMPREPLY=() ;; # file pattern, free text
  esac
}

_git_comma() {
  COMPREPLY=($(compgen -f -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_commit_browser() {
  COMPREPLY=()
}

_git_commit_count() {
  COMPREPLY=()
}

_git_commits_per_day() {
  COMPREPLY=()
}

_git_compact() {
  COMPREPLY=()
}

_git_conflicts() {
  COMPREPLY=()
}

_git_copy_branch_name() {
  COMPREPLY=()
}

_git_credit() {
  # args: author-name author-email (free text)
  COMPREPLY=()
}

_git_credit_author() {
  COMPREPLY=()
}

_git_current_branch() {
  COMPREPLY=()
}

_git_current_commit() {
  COMPREPLY=()
}

_git_cut_branch() {
  # arg: new branch name (free text)
  COMPREPLY=()
}

_git_delete_dangling_commits() {
  COMPREPLY=()
}

_git_delete_local_merged() {
  COMPREPLY=()
}

_git_delete_merged_branches() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_delete_remote_branch() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "$(__git_extra_remote_names)" ;;
    2) __git_extra_complete_words "$(__git_extra_remote_branch_names)" ;;
  esac
}

_git_delete_squashed_and_merged_branches() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_delete_tag() {
  __git_extra_complete_words "$(__git_extra_tag_names)"
}

_git_diff_last() {
  __git_extra_complete_words "$(__git_extra_tracked_files)"
}

_git_divergence() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "$(__git_extra_branch_names)" ;;
    2) __git_extra_complete_words "$(__git_extra_remote_branch_names)" ;;
  esac
}

_git_edit_conflicts() {
  COMPREPLY=()
}

_git_fetch_prs() {
  __git_extra_complete_words "$(__git_extra_remote_names)"
}

_git_files() {
  COMPREPLY=()
}

_git_find_dirty() {
  COMPREPLY=($(compgen -d -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_firefights() {
  COMPREPLY=()
}

_git_flush() {
  COMPREPLY=()
}

_git_force_mtimes() {
  COMPREPLY=()
}

_git_forest() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "--all --no-color --no-rebase -a --reverse --sha --style= --svdepth= --pretty="
}

_git_functionlog() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -ge 2 ]]; then
    COMPREPLY=($(compgen -W "$(__git_extra_tracked_files)" -- "$cur"))
  fi
}

_git_fzf_add() {
  COMPREPLY=()
}

_git_fzf_log_browser() {
  COMPREPLY=()
}

_git_fzf_pickaxe_browser() {
  # arg: search term (free text)
  COMPREPLY=()
}

_git_fzf_reflog_browser() {
  COMPREPLY=()
}

_git_git() {
  COMPREPLY=()
}

_git_github_open() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=($(compgen -W "$(__git_extra_tracked_files)" -- "$cur"))
  fi
}

_git_gitlab_mr() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_history_eraser() {
  COMPREPLY=($(compgen -f -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_history_graph() {
  COMPREPLY=()
}

_git_ignored() {
  COMPREPLY=()
}

_git_improved_merge() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_incoming() {
  __git_extra_complete_words "$(__git_extra_remote_branch_names)"
}

_git_jump() {
  __git_extra_complete_words "forward backward"
}

_git_latest_tag() {
  COMPREPLY=()
}

_git_lines() {
  # arg: file extension (free text)
  COMPREPLY=()
}

_git_list_semvers() {
  COMPREPLY=()
}

_git_log_single_file() {
  __git_extra_complete_words "$(__git_extra_tracked_files)"
}

_git_ls_branch_files() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_ls_conflicts() {
  COMPREPLY=()
}

_git_ls_object_refs() {
  # arg: object SHA1 (free text)
  COMPREPLY=()
}

_git_make_gitignore() {
  # arg: language/framework names (free text)
  COMPREPLY=()
}

_git_mark_all_resolved() {
  COMPREPLY=()
}

_git_maxpack() {
  COMPREPLY=()
}

_git_merged_branches() {
  COMPREPLY=()
}

_git_most_changed() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "-h --help -n --num-files --numfiles"
}

_git_mostchanged() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "-h --help -n --num-files --numfiles"
}

_git_move_commits() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 2 ]]; then
    COMPREPLY=($(compgen -W "$(__git_extra_branch_names)" -- "$cur"))
  fi
}

_git_neck() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_nuke() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_nuke_untracked_files() {
  COMPREPLY=()
}

_git_object_deflate() {
  COMPREPLY=($(compgen -f -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_oldest_common_ancestor() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_open_jira() {
  COMPREPLY=()
}

_git_origin_head() {
  COMPREPLY=()
}

_git_outgoing() {
  __git_extra_complete_words "$(__git_extra_remote_branch_names)"
}

_git_overwritten() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_pie_ify() {
  # args: pattern replacement (free text)
  COMPREPLY=()
}

_git_plotrepo() {
  COMPREPLY=()
}

_git_pr_fetch() {
  __git_extra_complete_words "$(__git_extra_remote_names)"
}

_git_pr_list() {
  COMPREPLY=()
}

_git_promote() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "$(__git_extra_remote_names)" ;;
    2) __git_extra_complete_words "$(__git_extra_branch_names)" ;;
  esac
}

_git_prune_branches() {
  COMPREPLY=()
}

_git_pruneall() {
  __git_extra_complete_words "$(__git_extra_remote_names)"
}

_git_publish() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "$(__git_extra_remote_names)" ;;
    2) __git_extra_complete_words "$(__git_extra_branch_names)" ;;
  esac
}

_git_purge_from_history() {
  COMPREPLY=($(compgen -f -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_pylint() {
  COMPREPLY=()
}

_git_rank_contributors() {
  __git_extra_complete_words "-v -o"
}

_git_rebase_authors() {
  COMPREPLY=()
}

_git_rebase_theirs() {
  __git_extra_complete_words "$(__git_extra_conflicted_files)"
}

_git_rebase_work_in_progress() {
  COMPREPLY=()
}

_git_recent() {
  COMPREPLY=()
}

_git_recently_checkedout_branches() {
  COMPREPLY=()
}

_git_ref_recent() {
  COMPREPLY=()
}

_git_rel() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_related() {
  __git_extra_complete_words "$(__git_extra_tracked_files)"
}

_git_release_tag() {
  __git_extra_complete_words "$(__git_extra_tag_names)"
}

_git_remote_default_branch() {
  __git_extra_complete_words "$(__git_extra_remote_names)"
}

_git_remove_conflicts() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "ours theirs" ;;
    *) __git_extra_complete_words "$(__git_extra_conflicted_files)" ;;
  esac
}

_git_rename_branches() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "-h --help -v --verbose -n --dry-run"
}

_git_replace_author() {
  # args: old-name new-name new-email (free text)
  COMPREPLY=()
}

_git_reset_with_fire() {
  COMPREPLY=()
}

_git_restore_mtime() {
  __git_extra_complete_words "$(__git_extra_tracked_files)"
}

_git_review_commits() {
  COMPREPLY=()
}

_git_rm_deleted_from_repo() {
  COMPREPLY=()
}

_git_root_directory() {
  COMPREPLY=()
}

_git_roots() {
  COMPREPLY=()
}

_git_run_command_on_revisions() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case $COMP_CWORD in
    1) __git_extra_complete_words "-v $(__git_extra_refs)" ;;
    2) __git_extra_complete_words "$(__git_extra_refs)" ;;
    3) COMPREPLY=() ;; # command to run (free text)
  esac
}

_git_semvers() {
  COMPREPLY=()
}

_git_shamend() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "-h --help -a --all $(__git_extra_refs)"
}

_git_show_overwritten() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_shrink_repo() {
  COMPREPLY=()
}

_git_side_by_side() {
  __git_extra_complete_words "$(__git_extra_tracked_files)"
}

_git_sp() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 1 ]]; then
    __git_extra_complete_words "-a"
  fi
}

_git_sr() {
  COMPREPLY=()
}

_git_stashes() {
  COMPREPLY=()
}

_git_stats() {
  COMPREPLY=()
}

_git_submodule_ls() {
  COMPREPLY=()
}

_git_submodule_paths() {
  COMPREPLY=()
}

_git_submodule_rm() {
  COMPREPLY=($(compgen -d -- "${COMP_WORDS[COMP_CWORD]}"))
}

_git_superpull() {
  COMPREPLY=()
}

_git_switch_branch() {
  # arg: branch substring (free text, partial match)
  COMPREPLY=()
}

_git_tag_and_sign() {
  # args: tag-name tag-message (free text)
  COMPREPLY=()
}

_git_tag_diff() {
  COMPREPLY=()
}

_git_taglist() {
  COMPREPLY=()
}

_git_tags() {
  COMPREPLY=()
}

_git_thanks() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_track() {
  COMPREPLY=()
}

_git_trail() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_undelete() {
  # arg: file path (previously deleted, free text)
  COMPREPLY=()
}

_git_undo() {
  COMPREPLY=()
}

_git_undo_push() {
  __git_extra_complete_words "$(__git_extra_branch_names)"
}

_git_unpushed() {
  COMPREPLY=()
}

_git_unpushed_stat() {
  COMPREPLY=()
}

_git_unreleased() {
  COMPREPLY=()
}

_git_up() {
  COMPREPLY=()
}

_git_up_old() {
  COMPREPLY=()
}

_git_upstream_name() {
  COMPREPLY=()
}

_git_upstream_sync() {
  COMPREPLY=()
}

_git_velocity() {
  COMPREPLY=()
}

_git_what_the_hell_just_happened() {
  COMPREPLY=()
}

_git_when_merged() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_where() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_where_pr() {
  __git_extra_complete_words "$(__git_extra_refs)"
}

_git_whoami() {
  COMPREPLY=()
}

_git_winner() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "-h --help"
}

_git_wordiness() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  __git_extra_complete_words "-h --help -help -csv --csv -tsv --tsv -nh -nohead --nohead --order= -s="
}

_git_wtf() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$cur" == -* ]]; then
    __git_extra_complete_words "-l --long -a --all -A --all-commits -s --short -k --key -r --relations --dump-config"
  else
    __git_extra_complete_words "$(__git_extra_branch_names)"
  fi
}

# --- Register completions ---
# These work both as standalone commands (git-foo) and as git subcommands (git foo).
# Git's completion framework calls _git_foo for "git foo" automatically if using
# git-completion.bash; we register the standalone forms explicitly here.

_git_extra_commands_list=(
  git-add-match
  git-add-username-remote
  git-amend-all
  git-attic
  git-authors
  git-big-file
  git-branch-clean
  git-branch-date
  git-branch-diff
  git-branch-name
  git-branch-rebaser
  git-branch-status
  git-branches
  git-branches-that-touch
  git-brcl
  git-bug-clusters
  git-capture-wip
  git-change-author
  git-changelog
  git-changes
  git-checkout-branches
  git-checkout-by-date
  git-checkout-commit
  git-checkout-default-branch
  git-checkout-latest-tag
  git-checkout-pr
  git-checkout-preview
  git-checkout-tag
  git-children-of
  git-churn
  git-clone-subset
  git-comma
  git-commit-browser
  git-commit-count
  git-commits-per-day
  git-compact
  git-conflicts
  git-copy-branch-name
  git-credit
  git-credit-author
  git-current-branch
  git-current-commit
  git-cut-branch
  git-delete-dangling-commits
  git-delete-local-merged
  git-delete-merged-branches
  git-delete-remote-branch
  git-delete-squashed-and-merged-branches
  git-delete-tag
  git-diff-last
  git-divergence
  git-edit-conflicts
  git-fetch-prs
  git-files
  git-find-dirty
  git-firefights
  git-flush
  git-force-mtimes
  git-forest
  git-functionlog
  git-fzf-add
  git-fzf-log-browser
  git-fzf-pickaxe-browser
  git-fzf-reflog-browser
  git-git
  git-github-open
  git-gitlab-mr
  git-history-eraser
  git-history-graph
  git-ignored
  git-improved-merge
  git-incoming
  git-jump
  git-latest-tag
  git-lines
  git-list-semvers
  git-log-single-file
  git-ls-branch-files
  git-ls-conflicts
  git-ls-object-refs
  git-make-gitignore
  git-mark-all-resolved
  git-maxpack
  git-merged-branches
  git-most-changed
  git-mostchanged
  git-move-commits
  git-neck
  git-nuke
  git-nuke-untracked-files
  git-object-deflate
  git-oldest-common-ancestor
  git-open-jira
  git-origin-head
  git-outgoing
  git-overwritten
  git-pie-ify
  git-plotrepo
  git-pr-fetch
  git-pr-list
  git-promote
  git-prune-branches
  git-pruneall
  git-publish
  git-purge-from-history
  git-pylint
  git-rank-contributors
  git-rebase-authors
  git-rebase-theirs
  git-rebase-work-in-progress
  git-recent
  git-recently-checkedout-branches
  git-ref-recent
  git-rel
  git-related
  git-release-tag
  git-remote-default-branch
  git-remove-conflicts
  git-rename-branches
  git-replace-author
  git-reset-with-fire
  git-restore-mtime
  git-review-commits
  git-rm-deleted-from-repo
  git-root-directory
  git-roots
  git-run-command-on-revisions
  git-semvers
  git-shamend
  git-show-overwritten
  git-shrink-repo
  git-side-by-side
  git-sp
  git-sr
  git-stashes
  git-stats
  git-submodule-ls
  git-submodule-paths
  git-submodule-rm
  git-superpull
  git-switch-branch
  git-tag-and-sign
  git-tag-diff
  git-taglist
  git-tags
  git-thanks
  git-track
  git-trail
  git-undelete
  git-undo
  git-undo-push
  git-unpushed
  git-unpushed-stat
  git-unreleased
  git-up
  git-up-old
  git-upstream-name
  git-upstream-sync
  git-velocity
  git-what-the-hell-just-happened
  git-when-merged
  git-where
  git-where-pr
  git-whoami
  git-winner
  git-wordiness
  git-wtf
)

# Map command names (with hyphens) to function names (with underscores)
for _cmd in "${_git_extra_commands_list[@]}"; do
  _func="${_cmd//git-/git_}"
  _func="_${_func//-/_}"
  if declare -f "$_func" >/dev/null 2>&1; then
    complete -F "$_func" "$_cmd"
  fi
done
unset _cmd _func _git_extra_commands_list
