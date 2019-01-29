import React, { Fragment } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import { ThemeProvider } from 'styled-components';

import theme, { BodyStyler } from './theme';

import Header from './parts/Header';
import Banner from './parts/Banner';
import Expertises from './parts/Expertises';
import Projects from './parts/Projects';
import Footer from './parts/Footer';

function Body(props) {
  return <div>
    <Header />
    <Banner />
    <Expertises />
    <Projects />
    <Footer />
  </div>
}

export default function App(props) {
  return <ThemeProvider theme={theme}>
    <Router>
      <>
        <BodyStyler />
        <Route path='/' component={Body} />
      </>
    </Router>
  </ThemeProvider>;
}
