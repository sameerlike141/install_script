<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<style type="text/css">

.style1 {
	color: #FF9900;
	font-weight: bold;
}
.style2 {
	color: #3399FF;
	font-weight: bold;
}

</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper clearfix">
<!-- Main content -->
<div class="header-content">
                    <h2><img src="https://image.flaticon.com/icons/svg/603/603198.svg" width="30" height="30"> ServerAll <span>เลือกตามไลฟ์สไตส์ของตัวเองเลย</span></h2>
                </div>
				<ul class="nav nav-stacked">	
		 <li><a href="#"><b> ชื่อผู้ใช้ <?php echo  $user->username ?></b><span class="pull-right"><b> ยอดเงินคงเหลือ <?= $user -> saldo ?> บาท </b></span></a></li>
	</ul>
    		<section class="content">
												<?php if (isset($message)) : ?>
									<?php echo  $message ?>
<script language="javascript">
var text = "อัพเดตยอดเงินไอดี <?= $users -> username ?> คงเหลือ <?= $users -> saldo ?> บาท";
alert(text);
</script>

							<?php endif; ?>	
    		  <div class="row">
                    <div class="col-md-12 text-center">

                    </div>
              </div>	  
             <div class="row">
			

        <?php foreach($server as $row): ?>
		
<div class="col-sm-6 col-md-4 col-lg-3">    
<div class="box box-widget widget-user">

        <div class="widget-user-header" style="background: url('/asset/img/servers.jpeg') center center;">
        </div>
	
        <div class="widget-user-image">
          <img class="img-circle" src="<?php 
		if ($row['Location']=='Thailand') { 
		echo 'https://cloudscene.global.ssl.fastly.net/CountryFlags/TH.png';
		} else {
		echo 'https://cloudscene.global.ssl.fastly.net/CountryFlags/SG.png';
		}
	?>" alt="User Avatar">
        </div>		
		
        <div class="box-footer">           
              <div class="description-block">
			  <h5 class="description-header"><span style="font-size: 16px;" class="badge bg-navy">เซิร์ฟเวอร์ : [ <?php echo  $row['ServerName']?> ]</span></h5><br>
			<h5 class="description-header"><span style="font-size: 16px;" class="badge bg-navy">ที่ตั้ง : [ <?php echo  $row['Location']?> ]</span></h5><br>
         	  </div>
			  <table width="100%" class="table">
                        <tbody>
                        <tr>
                          <td><strong>วันใช้งาน</strong></td>
                          <td><div align="right">
                          <strong>ราคา</strong></td>
                        </tr>
                        <tr>
						   <td><span class="badge bg-navy"><?php echo  $row['Expired']?> วัน</span></td>
                          <td><span class="pull-right badge bg-navy"><?php echo  $row['Price']?> ដុល្លា</span></td>
                        </tr>
                        <tr>
                          <td><strong>ความเร็วVPN</strong></td>
                          <td><div align="right">
                          <strong>เชื่อมต่อได้</strong></td>
                        </tr>
                        <tr>
                          <td><span class="badge bg-navy">100Mbps</span></td>
                          <td><span class="pull-right badge bg-navy">1 เครื่อง</span></td>
                        </tr>
                    </tbody>
				</table>
		</div>
	 
       	 <div class="panel-footer text-center">
		<div class="btn-group btn-group-justified">
<?php if ($row['Status']) { ?>
			<a href="#" data-toggle="modal" class="btn btn-success" data-target="#<?php echo  $row['Id']?>"><i class="fa fa-shopping-cart fa-fw"></i> เช่า VPN</a>
<?php
} else {
echo  '<a href="" data-toggle="modal" class="btn btn-red" data-target="./"><i class="fa fa-shopping-cart fa-fw"></i> เซิร์ฟเวอร์เต็ม</a>';
}?>			
        </div>
		

                                        
<div class="modal fade" id="<?php echo  $row['Id']?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">การรับประกันการใช้งาน !</h4>
      </div>
      <div class="modal-body">
        1.VPN 1 ไอดี สามารถต่อได้ 1 เครื่องนะครับ<br/>
		2.ความเร็วเน็ต VPN ขึ้นอยู่กับพื้นที่ใช้งาน<br/>
		3.หากเช่าเซิร์ฟเวอร์ไปแล้วจะไม่มีบริการคืนเงินทุกกรณี<br/>
		4.กรุณาใช้ไฟล์ให้ถูกการใช้งาน เพื่อไม่ให้ส่งผลกระทบต่อลูกค้าท่านอื่น<br/>
		5.ถ้าพบเห็นการใช้งานที่ผิดปกติแอดมินสามารถระงับการใช้งาน ได้โดยไม่แจ้งล่วงหน้าครับผม<br/>
      </div>
      <div class="modal-footer">
	  <div class="btn-group btn-group-justified">
			<a href="<?php echo  base_url('checkuot/day/'.$_SESSION['username'].'/buy/'.str_replace(' ','-',$row['ServerName']).'/'.$row['Id']) ?>" class="btn btn-success">เช่ารายวัน</a>   
			<a href="#"class="btn btn-default" data-dismiss="modal"><i class="fa fa-key"></i> ยกเลิก</a>
			<a href="<?php echo  base_url('checkuot/month/'.$_SESSION['username'].'/buy/'.str_replace(' ','-',$row['ServerName']).'/'.$row['Id']) ?>" class="btn btn-success">เช่ารายเดือน</a>
        </div>	
      </div>
    </div>
  </div>
</div></div>
                    
                    
                    
         </div>
          </div>
        <?php endforeach; ?>
    </div>     
    </section>
</div>
</div>
</div>
