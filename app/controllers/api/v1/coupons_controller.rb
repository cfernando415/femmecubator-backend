class Api::V1::CouponsController < ApplicationController
    def index
        @coupons = Coupon.all
        render json: CouponSerializer.new(@coupons)
    end
    def create
        @coupon = Coupon.create(coupons_params)
        render json: CouponSerializer.new(@coupon)
    end

    private
    def coupons_params
        params.require(:coupon_info).permit(:coupon_code, :sponsor, :description, :expiration, :member_id)
    end
end
