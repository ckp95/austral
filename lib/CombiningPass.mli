(*
   Part of the Austral project, under the Apache License v2.0 with LLVM Exceptions.
   See LICENSE file for details.

   SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
*)
(** The combining pass takes the concrete representation of module interfaces
    and module bodies, and combines them into a single object for simplicity. *)
open Identifier
open Imports
open Cst
open Stages.Combined
open Env

(** Given an interface declaration, and a body declaration, return the combined
    declaration if they're the same, and fail otherwise. *)
val match_decls : module_name -> import_map -> import_map -> concrete_decl -> concrete_def -> combined_definition

(** Convert a private definition to a combined one *)
val private_def : module_name -> import_map -> concrete_def -> combined_definition

(** Combine a concrete module interface and a concrete module body into a
    combined module. *)
val combine : env -> concrete_module_interface -> concrete_module_body -> combined_module

(** Make a combined module out of a module body, with all declarations being public. *)
val body_as_combined : env -> concrete_module_body -> combined_module
