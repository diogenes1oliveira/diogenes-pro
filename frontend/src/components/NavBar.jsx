import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

export const NavLink = styled(Link)`
  border-bottom: solid 3px transparent;
  color: white;
  margin-bottom: 3px;
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
  margin: 5px;
  padding-bottom: 3px;
  text-align: right;
`;
