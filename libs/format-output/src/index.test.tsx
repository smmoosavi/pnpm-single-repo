import { FormatOutput } from './index';
import { render } from '@testing-library/react';
import React from 'react';

describe('FormatOutput', () => {
  it('should render format-output', () => {
    const { container } = render(<FormatOutput />);
    expect(container.textContent).toBe('the-format');
  });
});
