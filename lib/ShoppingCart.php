<?php

class Product{
    var $id; #masanpham
    var $num; #soluong
}
class ShoppingCart{
    var $listProduct;
    public function _construct(){
        $this->listProduct=array();#khoitaomang

    }
    public function update($id, $newNum){
        for($i=0;$i<count($this->listProduct); $i++){#timkiemvetcan
            if($this->listProduct[$i]->id==$id){
                $this->listProduct[$i]->num=$newNum;#soluongmoi
            }
        }
    }
    public function delete($id){
        for($i=0;$i<count($this->listProduct);$i++){#timkiemvetcan
            if($this->listProduct[$i]->id==$id)
            array_splice($this->listProduct,$i,1);#xoasanphamkhoigiohang
        }
    }
    public function add($id){
        if(count($this->listProduct)==0){
            // Chưa có sản phẩm trong giỏ hàng
            $p=new Product();
            $p->id=$id;
            $p->num=1;

            $this->listProduct[]=$p;#sanphamdautien
        
    }
    else{
        //Đã có sản phẩm trong giỏ hàng rồi 
        //Cần kiểm tra sản phẩm đó đã tồn tại trong giỏi hàng chưa
        //Nếu đã có rồi thì chỉ cần cập nhập số lượng lên 1
        //nếu chưa có thì thêm mới sản phẩm đó vào giỏ hàng
        for($i=0;$i<count($this->listProduct);$i++){
            if($this->listProduct[$i]->id==$id)
        break;
        }
    
        if($i==count($this->listProduct))
        {
            //Co nghia la da duyet het gio hang ma khong co san pham can them vao
            //them san pham moi vao gio hang
            $p=new Product();
            $p->id=$id;
            $p->num=1;

            $this->listProduct[]=$p;
        }
    else{
        $this->listProduct[$i]->num++;#soluong+1 khi kiem tra da ton tai sp trong gio hang
    }

    }

 }

}
?>
