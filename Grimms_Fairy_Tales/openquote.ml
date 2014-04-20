let input_char_opt ic =
  try Some (input_char ic)
  with End_of_file -> None

let is_alpha = function
  | 'a'..'z' | 'A'..'Z' -> true | _ -> false

type quote_kind =
  | Opening_quote
  | Closing_quote
  | Middle_quote
  | Alone_quote
  | Not_quote

let which_quote c0 c1 c2 =
  match
  ( is_alpha c0,
    c1,
    is_alpha c2 )
  with
  | false, '\'', true -> Opening_quote
  | true, '\'', false -> Closing_quote
  | true, '\'', true -> Middle_quote
  | false, '\'', false -> Alone_quote
  | _ -> Not_quote

let () =
  let ic = open_in Sys.argv.(1) in
  let c0 = input_char ic in
  let c1 = input_char ic in
  let rec aux c0 c1 =
    match (c0, c1, input_char_opt ic) with
    | c0, c1, Some c2 ->
        begin match which_quote c0 c1 c2 with
        | Closing_quote
        | Middle_quote
        | Alone_quote
        | Not_quote ->
            print_char c0;
            aux c1 c2
        | Opening_quote ->
            print_char c0;
            aux '`' c2
        end
    | c0, c1, None ->
        print_char c0;
        print_char c1;
        close_in ic;
  in
  aux c0 c1
