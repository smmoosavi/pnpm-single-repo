/**
 * @public
 */
export interface Options {}

/**
 *
 * return `format-output` string
 *
 * @returns the `format-output`  string
 *
 * @example
 * Here's an example:
 *
 * ```ts
 * import { FormatOutput } from 'format-output'
 *
 * console.log(FormatOutput());
 * // Prints "format-output":
 * ```
 */
export function FormatOutput(options?: Options) {
  return 'format-output';
}
