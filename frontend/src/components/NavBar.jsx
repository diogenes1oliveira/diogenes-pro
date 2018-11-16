import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

import { Media } from 'Components/Layout';

export const NavLink = styled(Link)`
  border-bottom: solid 3px transparent;
  color: white;
  text-decoration: none;
  &:hover {
    border-color: white;
  }
  &:not(:last-child) {
    margin-right: 10px;
  }
`;

export default styled(
  props => <nav {...props}>
    <NavLink to='/'>
      home
    </NavLink>
    <NavLink to='/expertise'>
      expertise
    </NavLink>
    <NavLink to='/projects'>
      projects
    </NavLink>
    <NavLink to='/about'>
      about
    </NavLink>
  </nav>
)`
  text-align: right;
`;
