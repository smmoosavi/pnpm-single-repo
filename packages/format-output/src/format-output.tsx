import { TheFormat } from 'the-format';
import React from 'react';

/**
 * @public
 */
export interface Options {}

/**
 *
 */
export function FormatOutput(options?: Options) {
  const format = TheFormat();
  return <span>{format}</span>;
}
