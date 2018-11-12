import React from 'react';
import styled, { css } from 'styled-components';

// Creates a responsive grid with breakpoints for each size
// Based on https://medium.com/styled-components/how-to-create-responsive-ui-with-styled-components-c6b71a3ce172

export const sizes = {
  xs: 576,
  sm: 768,
  md: 992,
  lg: 1200,
};

export const Media = Object.keys(sizes).reduce((media, sizeLabel) => {
  const sizePx = `${sizes[sizeLabel]}px`;

  media[sizeLabel] = (...args) => css`
    @media (min-width: ${sizePx}) {
      ${css(...args)}
    }
  `;

  return media;
}, {});

export const Row = styled.div`
  &::after {
    content: "";
    clear: both;
    display: table;
  }
`;

function getWidthString(span) {
  return span && `${span / 12 * 100}%`;
}

export const Col = styled.div`
  float: left;

  ${({xs}) => xs ? getWidthString(xs) : 'width: 100%;'}

  ${({sm}) => sm ? Media.sm`
    width: ${getWidthString(sm)};
  ` : ''}

  ${({md}) => md ? Media.md`
    width: ${getWidthString(md)};
  ` : ''}

  ${({lg}) => lg ? Media.lg`
    width: ${getWidthString(lg)};
  ` : ''}
`;
