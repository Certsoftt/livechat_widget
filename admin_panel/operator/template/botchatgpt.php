<?php include_once 'header.php';?>

<div class="content">

<!-- Small boxes (Stat box) -->
<div class="row">
  <div class="col-md-3">
    <div class="card card-stats">
      <div class="card-body">
        <div class="statistics statistics-horizontal">
          <div class="info info-horizontal">
            <div class="row">
              <div class="col-3">
                <div class="icon icon-primary icon-circle">
                  <i class="fa fa-robot"></i>
                </div>
              </div>
              <div class="col-9 text-right">
                <h3 class="info-title"><?php echo count($BOT_ALL);?></h3>
                <h6 class="stats-title"><?php echo $jkl["stat_s52"];?></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div class="card-footer">
        <div class="stats">
          <i class="fa fa-robot"></i> <?php echo $jkl["stat_s52"];?>
        </div>
      </div>
    </div>
  </div><!-- ./col -->
  <div class="col-md-3">
    <div class="card card-stats">
      <div class="card-body">
        <div class="statistics statistics-horizontal">
          <div class="info info-horizontal">
            <div class="row">
              <div class="col-3">
                <div class="icon icon-info icon-circle">
                  <i class="fal fa-language"></i>
                </div>
              </div>
              <div class="col-9 text-right">
                <h3 class="info-title"><?php echo strtoupper(JAK_LANG);?></h3>
                <h6 class="stats-title"><?php echo $jkl["u11"];?></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div class="card-footer">
        <div class="stats">
          <i class="fa fa-language"></i> <?php echo $jkl["u11"];?>
        </div>
      </div>
    </div>
  </div><!-- ./col -->
  <div class="col-md-3">
    <div class="card card-stats">
      <div class="card-body">
        <div class="statistics statistics-horizontal">
          <div class="info info-horizontal">
            <div class="row">
              <div class="col-5">
                <div class="icon icon-success icon-circle">
                  <i class="fas fa-users-cog"></i>
                </div>
              </div>
              <div class="col-7 text-right">
                <h3 class="info-title"><?php echo $totalChange;?></h3>
                <h6 class="stats-title"><?php echo $jkl["stat_s49"];?></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div class="card-footer">
        <div class="stats">
          <i class="fa fa-users-cog"></i> <?php echo $jkl["stat_s49"];?>
        </div>
      </div>
    </div>
  </div><!-- ./col -->
  <div class="col-md-3">
    <div class="card card-stats">
      <div class="card-body">
        <div class="statistics statistics-horizontal">
          <div class="info info-horizontal">
            <div class="row">
              <div class="col-3">
                <div class="icon icon-warning icon-circle">
                  <i class="fa fa-clock"></i>
                </div>
              </div>
              <div class="col-9 text-right">
                <h3 class="info-title"><?php echo ($lastChange ? JAK_base::jakTimesince($lastChange, JAK_DATEFORMAT, "") : "-");?></h3>
                <h6 class="stats-title"><?php echo $jkl["stat_s53"];?></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div class="card-footer">
        <div class="stats">
          <i class="fa fa-clock"></i> <?php echo $jkl["stat_s53"];?>
        </div>
      </div>
    </div>
  </div><!-- ./col -->
</div><!-- /.row -->

<p>
<ul class="nav nav-pills nav-pills-primary">
  <li class="nav-item">
    <a class="nav-link<?php if ($page == 'bot' && empty($page1)) echo ' active';?>" href="<?php echo JAK_rewrite::jakParseurl('bot');?>"><?php echo $jkl["m23"];?></a>
  </li>
  <li class="nav-item">
    <a class="nav-link<?php if ($page1 == 'chatgpt') echo ' active';?>" href="<?php echo JAK_rewrite::jakParseurl('bot', 'chatgpt');?>"><?php echo $jkl["m36"];?></a>
  </li>
</ul>
</p>

<?php if (isset($BOT_ALL) && !empty($BOT_ALL)) { ?>

<form method="post" class="jak_form" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
<div class="card">
<div class="card-body">

<?php if (JAK_SUPERADMINACCESS) { ?>
<p class="pull-right">
<a class="btn btn-warning btn-sm btn-confirm" href="<?php echo JAK_rewrite::jakParseurl('bot', 'chatgpt', 'truncate');?>" data-title="<?php echo addslashes($jkl["g48"]);?>" data-text="<?php echo addslashes($jkl["e40"]);?>" data-type="warning" data-okbtn="<?php echo addslashes($jkl["g279"]);?>" data-cbtn="<?php echo addslashes($jkl["g280"]);?>"><i class="fa fa-exclamation-triangle"></i></a> <button class="btn btn-secondary btn-sm btn-confirm" data-action="status" data-title="<?php echo addslashes($jkl["g359"]);?>" data-text="<?php echo addslashes($jkl["g360"]);?>" data-type="warning" data-okbtn="<?php echo addslashes($jkl["g279"]);?>" data-cbtn="<?php echo addslashes($jkl["g280"]);?>"><i class="fa fa-check"></i> / <i class="fa fa-times"></i></button> <button class="btn btn-danger btn-sm btn-confirm" data-action="delete" data-title="<?php echo addslashes($jkl["g48"]);?>" data-text="<?php echo addslashes($jkl["e30"]);?>" data-type="warning" data-okbtn="<?php echo addslashes($jkl["g279"]);?>" data-cbtn="<?php echo addslashes($jkl["g280"]);?>"><i class="fa fa-trash-alt"></i></button>
</p>
<div class="clearfix"></div>
<?php } ?>

<table id="dynamic-data" class="table table-striped" cellspacing="0" width="100%">
<thead>
  <tr>
    <th style="width: 3%">#</th>
    <th style="width: 3%"><input type="checkbox" id="jak_delete_chatgpt"></th>
    <th><i class="fal fa-question" title="<?php echo $jkl["g269"];?>"></i></th>
    <th><i class="fal fa-reply" title="<?php echo $jkl["g273"];?>"></i></th>
    <th><i class="fal fa-clock" title="<?php echo $jkl["g357"];?>"></i></th>
    <th><i class="fal fa-calendar-day" title="<?php echo $jkl["g358"];?>"></i></th>
    <th><?php echo $jkl["g101"];?></th>
  </tr>
</thead>
<tfoot>
  <tr>
    <th style="width: 3%">#</th>
    <th style="width: 3%"></th>
    <th><i class="fal fa-question" title="<?php echo $jkl["g269"];?>"></i></th>
    <th><i class="fal fa-reply" title="<?php echo $jkl["g273"];?>"></i></th>
    <th><i class="fal fa-clock" title="<?php echo $jkl["g357"];?>"></i></th>
    <th><i class="fal fa-calendar-day" title="<?php echo $jkl["g358"];?>"></i></th>
    <th><?php echo $jkl["g101"];?></th>
  </tr>
</tfoot>
<tbody></tbody>
</table>

</div>
</div>
<input type="hidden" name="action" id="action">
</form>

<?php } else { ?>

<div class="alert alert-info">
<?php echo $jkl['i3'];?>
</div>

<?php } ?>

</div>

<?php include_once 'footer.php';?>