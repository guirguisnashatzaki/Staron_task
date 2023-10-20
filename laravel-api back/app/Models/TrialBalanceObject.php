<?php

namespace App\Models;

class TrialBalanceObject {
  // Properties
  public int $tC;
  public int $tD;

  // Methods
  function set_tc(int $name) {
    $this->tC = $name;
  }

  function set_td(int $name) {
    $this->tD = $name;
  }

}
